import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../config.dart';
import 'package:mqtt/mqtt.dart' as mqtt;
import '../entrys/cfg_simple_notification.dart';

// part of flutter_uibox;

class CfgSimpleNotificationStatus with ChangeNotifier {
  static CfgSimpleNotification? _config;

  bool get ready {
    return _config != null;
  }

  bool get enable {
    return _config?.enable == true;
  }

  List<CfgSimpleNotificationItem> get items {
    return _config?.items ?? [];
  }

  Future<void> init() async {
    Completer com = Completer();
    mqtt.MessageUtils.wsSub(
        "${EConfig.ns}/c/noc", (msg) {
      try {
        var __config = CfgSimpleNotification.fromJson(
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
        print("err pf: $err");
      }
    });
    return com.future;
  }
}
