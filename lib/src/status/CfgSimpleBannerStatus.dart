import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../config.dart';
import '../entrys/cfg_simple_banner.dart';
import 'package:mqtt/mqtt.dart' as mqtt;

// part of flutter_uibox;

class CfgSimpleBannerStatus with ChangeNotifier {
  static CfgSimpleBanner? _config;

  bool get ready {
    return _config != null;
  }

  bool get enable {
    return _config?.enable == true;
  }

  int get width {
    return _config?.width ?? 1800;
  }

  int get height {
    return _config?.height ?? 900;
  }

  List<CfgSimpleBannerItem> get items {
    return _config?.items ?? [];
  }

  Future<void> init() async {
    Completer com = Completer();
    mqtt.MessageUtils.wsSub(
        "${EConfig.ns}/c/banner", (msg) {
      try {
        var __config = CfgSimpleBanner.fromJson(
            json.decode(utf8.decode(gzip.decode(msg))));
        if (json.encode(__config).toString() !=
            json.encode(_config).toString()) {
          if ((__config.items.length) == 0) {
            __config.enable = false;
          }
          _config = __config;
          if (hasListeners) {
            notifyListeners();
          }
        }
        if (!com.isCompleted) {
          com.complete();
        }
      } catch (err) {
        print("err CfgSimpleBanner: $err");
      }
    });
    return com.future;
  }
}
