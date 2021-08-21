import 'package:corex/corex.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import './config.dart';
import './deviceinfo.dart';
import './packageinfo.dart';
import './ui.dart';
import './DioAdapter.dart';
import './MQTTAdapter.dart';
import './HttpJsonPackage.dart';
import './status/AuthStatus.dart';
import './status/CfgBaseStatus.dart';
import './status/UserAssetStatus.dart';
import 'package:provider/provider.dart';

Future<void> _loadUiBoxMqttSubcribe(BuildContext context) {
  return Future.wait([
    context.read<AuthStatus>().init(),
    context.read<CfgBaseStatus>().init(),
  ])
      .then((_) => context.read<CfgBaseStatus>().tipUpdate(context)) //提示升级
      .then((_) => context.read<CfgBaseStatus>().notice(context))
      .then((_) {
    context.read<UserAssetStatus>().init();
  });
}

Future<void> initCore(BuildContext context, String mqttUrl,
    {String? nameSpace, bool? signMarddownRequest}) {
  if (nameSpace != null) {
    EConfig.ns = nameSpace;
  }
//Markdown回调
  // registerMarkDownOpenRemotePageHandle((
  //         {CancelToken? cancelToken,
  //         String url = "",
  //         GlobalKey<RefreshIndicatorState>? refreshKey}) =>
  //     DioAdapter()
  //         .openPage(url, cancelToken: cancelToken, sign: signMarddownRequest)
  //         .catchError((err) {
  //       if (refreshKey?.currentContext != null) {
  //         alert(refreshKey!.currentContext!, err.toString(),
  //             cb: () => Navigator.of(refreshKey.currentContext!).pop());
  //       }
  //     }));

  addJsonHandle<int>((obj) => obj ?? 0);
  addJsonHandle<int?>((obj) => obj);
  addJsonHandle<String>((obj) => obj ?? "");
  addJsonHandle<String?>((obj) => obj);
  addJsonHandle<bool>((obj) => obj ?? false);
  addJsonHandle<bool?>((obj) => obj);
  addJsonHandle<Map<String, dynamic>>((obj) => obj ?? {});
  addJsonHandle<Map<String, dynamic>?>((obj) => obj);
  addJsonHandle<AssetHistory>((obj) => obj);
  //
  EConfig.mqttServer = mqttUrl;

  return Future.wait([initDeviceID(), initPackageInfo()])
      .then((_) => MQTTAdapter.init())
      .then((_) => _loadUiBoxMqttSubcribe(context));
}
