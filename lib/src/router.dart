export 'WiseLaunchAdapter.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

showAnimatePage(BuildContext context, Widget widget,
    {int animate = 0,
    bool root = true,
    bool fullscreenDialog = false,
    bool maintainState = false,
    bool replace = false}) {
  if (replace) {
    Navigator.of(context, rootNavigator: root).pushReplacement(
      MaterialPageRoute(
          builder: (context) => widget,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog),
    );
  } else {
    Navigator.of(context, rootNavigator: root).push(
      MaterialPageRoute(
          builder: (context) => widget,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog),
    );
  }
}

Future<String> Function({String url, CancelToken? cancelToken})
    onOpanMakeDoenRemotePage =
    ({String url = "", CancelToken? cancelToken}) => Future.error("未初始化");
void registerMarkDownOpenRemotePageHandle(
    Future<String> Function({
  String url,
  CancelToken? cancelToken,
})
        fun) {
  onOpanMakeDoenRemotePage = fun;
}
