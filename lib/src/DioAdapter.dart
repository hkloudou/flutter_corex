//System
import 'dart:convert';
import 'dart:io';

//Third part
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

//self
//core
import './packageinfo.dart';
import './deviceinfo.dart';

import './entrys/cfg_server.dart';
import './entrys/asset_history.dart';

//other
import './HttpJsonPackage.dart';
import './status/AuthStatus.dart';
import './status/CfgBaseStatus.dart';

class DioAdapter {
  late List<int> secrectKey;
  final Map<int, String> errs;

  DioAdapter(
      {this.secrectKey = const [],
      this.errs = const {
        0: '未知错误',
        403: '登陆状态失效，请重新登陆。',
        404: '网络错误，请稍后重试。',
        500: '服务器维护中，请稍后再试。\n或重启APP再试',
      }}) {
    if (secrectKey.isEmpty) {
      secrectKey = utf8.encode('NIu)((*r5@)R(*F0&bs#@!v');
    }
  }
  Dio? _getDioClient(CfgServer? server) {
    if (server == null) {
      return null;
    }
    // JsonFactory._().createStorage(jsonConverter: PlatformConfigServerItem.fromJson)
    Dio dio = new Dio();
    dio.options = BaseOptions(
      baseUrl: "${server.unsafe ? "http://" : "https://"}${server.host}",
      connectTimeout:
          server.connectTimeout == 0 ? 10000 : server.connectTimeout,
      sendTimeout: server.sendTimeout == 0 ? 3000 : server.sendTimeout,
      receiveTimeout: server.receiveTimeout == 0 ? 3000 : server.receiveTimeout,
    );
    return dio;
  }

  Dio? _getServer(String name) {
    if (name == "localtest") {
      Dio dio = new Dio();
      dio.options = BaseOptions(
        baseUrl: "http://localhost:8080",
        connectTimeout: 10000,
        sendTimeout: 3000,
        receiveTimeout: 3000,
      );
      return dio;
    }
    return _getDioClient(CfgBaseStatus.getServer(name));
  }

  Dio _getBaseClient() {
    Dio dio = new Dio();
    dio.options = BaseOptions(
      // baseUrl: server != null ? server.url : "",
      connectTimeout: 10000,
      receiveTimeout: 3000,
    );
    return dio;
  }

  String handleError(DioError err) {
    if (err.response == null || err.response!.statusCode!.isNaN) {
      return errs[404] ?? errs[0]!;
    }
    if (errs.containsKey(err.response!.statusCode)) {
      return errs[err.response!.statusCode] ?? errs[0]!;
    }
    return errs[0]!;
  }

  String getErrors(int code) {
    if (errs.containsKey(code)) {
      return errs[code] ?? errs[0]!;
    }
    return errs[0]!;
  }

  Map<String, dynamic> getSignHead(String method) {
    var ts = DateTime.now().millisecondsSinceEpoch.toString();
    List<int> buf = [];
    buf.addAll(utf8.encode("$method\n$ts\nv1"));
    buf.addAll(AuthStatus.tokenStatic?.toList() ?? []);

    var tmp = {
      "authx-type": "v1",
      "authx-ts": ts,
      "authx-sign": new Hmac(sha256, secrectKey).convert(buf).toString(),
      "authx-did": deviceID,
      "authx-reqid": Uuid().v4(),
      "authx-os-pversion": Platform.version,
      "authx-os": Platform.operatingSystem,
      "authx-os-version": Platform.operatingSystemVersion,
      "authx-os-localeName": base64.encode(utf8.encode(Platform.localeName)),
      "authx-os-hostName": base64.encode(utf8.encode(Platform.localHostname)),
      "authx-pkg-packname": packageInfo.packageName,
      "authx-pkg-name": base64.encode(utf8.encode(packageInfo.appName)),
      "authx-pkg-ver": packageInfo.version,
      "authx-pkg-build": packageInfo.buildNumber,
    };
    if ((AuthStatus.tokenStatic?.toList() ?? []).length > 0) {
      tmp["authx-token"] = base64Encode(AuthStatus.tokenStatic?.toList() ?? []);
    }
    return tmp;
  }

  Future<String> openPage(String u,
      {CancelToken? cancelToken, Options? options, bool? sign}) async {
    options = options ??
        Options(
          responseType: ResponseType.plain,
          headers: sign ?? false ? getSignHead("GET") : null,
        );
    if (sign ?? false) {
      options.headers = options.headers ?? {};
      options.headers?.addAll(getSignHead("GET"));
    }
    try {
      var client = _getBaseClient();
      var res = await client.get(
        u,
        options: options,
        cancelToken: cancelToken,
      );
      try {
        client.close();
      } catch (err) {}
      if (res.statusCode != 200) {
        throw ("unknow error");
      }
      return Future.value(res.data);
    } on DioError catch (err) {
      return Future.error(handleError(err));
    } catch (err) {
      return Future.error(errs[0]!);
    }
  }

  Future<HttpJsonPackage<T>> getRequest<T>(String api, String path,
      {Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      bool? sign}) async {
    var client = _getServer(api);
    if (client == null) {
      return Future.value(HttpJsonPackage<T>.error(-2, "客户端初始失败\n可能正在升级中！！"));
    }
    options = options ??
        Options(
          responseType: ResponseType.json,
          contentType: ContentType.binary.toString(),
          headers: {},
        );
    if (sign ?? false) {
      options.headers = options.headers ?? {};
      options.headers?.addAll(getSignHead("GET"));
    }
    // print("client:${client.options.baseUrl}");
    // print("client:${client.options.}");
    try {
      var res = await client.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      // print("res:${res.realUri}");
      client.close();
      // print(res.data);
      if (res.statusCode != 200) {
        print("res.statusCode: ${res.statusCode}");
        return Future.value(HttpJsonPackage<T>.error(
            (res.statusCode) ?? -2, getErrors(res.statusCode ?? 0)));
      }
      var ret = HttpJsonPackage<T>.fromJson(res.data as Map<String, dynamic>?);
      if (ret.code != 0) {
        return Future.value(HttpJsonPackage<T>.error(ret.code, ret.msg));
      }
      return Future.value(ret);
    } on DioError catch (err) {
      if (CancelToken.isCancel(err)) {
        return Future.value(HttpJsonPackage<T>.cancel());
      }
      print("Dio error:$err");
      return Future.value(HttpJsonPackage<T>.error(
          (err.response?.statusCode) ?? -2, handleError(err)));
    } catch (err) {
      print("unknow err: $err");
      return Future.value(HttpJsonPackage<T>.error(-2, errs[0]!));
    }
  }

  Future<HttpJsonPackage<String>> rawRequest(String api, String path,
      {Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      bool? sign}) async {
    var client = _getServer(api);
    if (client == null) {
      return Future.error("客户端初始失败\n可能正在升级中！！");
    }
    options = options ??
        Options(
          responseType: ResponseType.plain,
        );

    if (sign ?? false) {
      options.headers = options.headers ?? {};
      options.headers?.addAll(getSignHead("GET"));
    }
    try {
      var res = await client.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          responseType: ResponseType.plain,
          headers: sign ?? false ? getSignHead("GET") : null,
        ),
      );
      client.close();

      if (res.statusCode != 200) {
        print("res.statusCode: ${res.statusCode}:${res.realUri}");
        return Future.error(getErrors(res.statusCode ?? 0));
      }
      // print(res.data);
      // var rrr = HttpJsonPackage<String>();
      // rrr.code = 0;
      return Future.value(HttpJsonPackage<String>(0, "", res.data.toString()));
    } on DioError catch (err) {
      if (CancelToken.isCancel(err)) {
        return Future.value(HttpJsonPackage<String>.cancel());
      }
      print("Dio2 error:$err Stack:${err.stackTrace.toString()}");
      return Future.value(HttpJsonPackage<String>.error(
          (err.response?.statusCode) ?? -2, handleError(err)));
    } catch (err) {
      print("unknow err: $err");
      return Future.value(HttpJsonPackage<String>.error(-2, errs[0]!));
    }
  }

  Future<HttpJsonPackage<List<AssetHistory>>> assetHistory(
      int before, String filter,
      {group = 0, CancelToken? cancelToken}) async {
    return getRequest<List<AssetHistory>>(
      "asset",
      "/asset.his.pagebf",
      sign: true,
      cancelToken: cancelToken,
      queryParameters: {
        "group": group,
        "before": "$before",
        "size": 20,
        "filter": filter
      },
      options: Options(
        responseType: ResponseType.json,
        contentType: ContentType.binary.toString(),
        headers: getSignHead("GET"),
      ),
    );
  }
}
