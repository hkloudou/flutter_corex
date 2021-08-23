import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../config.dart';
import '../packageinfo.dart';
import '../ui.dart';
import '../WiseLaunchAdapter.dart';
import '../entrys/cfg_base.dart';
import '../entrys/cfg_server.dart';
import 'package:mqtt/mqtt.dart' as mqtt;
// part of flutter_uibox;

class CfgBaseStatus with ChangeNotifier {
  static CfgBase? _config;

  bool get ready {
    return _config != null;
  }

  bool get isProductEnv {
    return bool.fromEnvironment("dart.vm.product");
  }

  //hasNewVersion 是否有新版
  bool? get hasNewVersion {
    if (!ready || lastVersion == null || (lastVersion ?? "").isEmpty) {
      return null;
    }
    var pkg = packageInfo;
    if (pkg.version != (lastVersion ?? "")) {
      return true;
    }
    return false;
  }

  //lastVersion 最新版本号
  String? get lastVersion {
    if (!ready) {
      return null;
    }
    String? ret;
    if (Platform.isAndroid) {
      ret = _config?.update.minSupportAndroidVersion;
    }
    if (Platform.isIOS) {
      ret = _config?.update.minSupportIOSVersion;
    }
    if (Platform.isWindows) {
      ret = _config?.update.minSupportWinVersion;
    }
    if (Platform.isMacOS) {
      ret = _config?.update.minSupportMacVersion;
    }
    if (ret == null) {
      return null;
    } else if (ret.isEmpty) {
      return null;
    } else {
      return ret;
    }
  }

  //lastUrl 最新网址
  String? get lastUrl {
    if (!ready) {
      return "";
    }
    String? ret;
    if (Platform.isAndroid) {
      ret = _config?.update.andoridHref;
    }
    if (Platform.isIOS) {
      ret = _config?.update.iosHref;
    }
    if (Platform.isWindows) {
      ret = _config?.update.winHref;
    }
    if (Platform.isMacOS) {
      ret = _config?.update.macHref;
    }
    if (ret == null) {
      return null;
    } else if (ret.isEmpty) {
      return null;
    } else {
      return ret;
    }
  }

  Future<void> notice(BuildContext context) {
    if (!ready || !isProductEnv) {
      return Future.value();
    }
    var _stopNotice = _config?.update.stopNotice ?? "";
    var _alertNotice = _config?.update.alertNoice ?? "";
    if (_stopNotice.isNotEmpty) {
      return alert(context, _stopNotice, cb: () {
        exit(0);
      });
    } else if (_alertNotice.isNotEmpty) {
      return alert(context, _alertNotice);
    }
    return Future.value();
  }

  Future<void> tipUpdate(BuildContext context) {
    if (!ready || !isProductEnv) {
      return Future.value();
    }
    if (hasNewVersion ?? false) {
      return alert(context, "请下载安装包，并安装更新！", cb: () {
        WiseLaunchAdapter.go(context, lastUrl ?? "", "在线升级",
            openInBrowser: true);
      });
    }
    return Future.value();
  }

  static List<CfgServer> getServerList(String key) {
    var items = _config?.servers
        .where((e) => e.group.toLowerCase().trim() == key.toLowerCase().trim())
        .toList();
    items?.sort((a, b) => b.power.compareTo(a.power));
    return items ?? [];
  }

  static CfgServer? getServer(String key) {
    var items = getServerList(key);
    if (items.length == 0) {
      return null;
    }
    return items[0];
  }

  Future<void> init({bool notifySame = false}) async {
    Completer com = Completer();
    mqtt.MessageUtils.wsSub(
        "${EConfig.ns}/c/base", (msg) {
      try {
        var __config =
            CfgBase.fromJson(json.decode(utf8.decode(gzip.decode(msg))));
        if (notifySame ||
            json.encode(__config).toString() !=
                json.encode(_config).toString()) {
          _config = __config;
          if (hasListeners) {
            notifyListeners();
          }
        }
        if (!com.isCompleted) {
          com.complete();
        }
      } catch (err) {
        print("err CfgBase: $err");
      }
    });
    return com.future;
  }
}
