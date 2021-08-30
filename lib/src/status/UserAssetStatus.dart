import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../config.dart';
import '../ext.dart';
import '../entrys/user_asset.dart';
import 'package:flutter/material.dart';
import 'package:mqtt/mqtt.dart' as mqtt;

class UserAssetStatus with ChangeNotifier {
  UserAssetStatus() {
    _last = this;
  }
  List<UserAsset> _config = [];
  bool ready = false;
  static UserAssetStatus? _last;
  Future<void> init({bool notifySame = false}) {
    Completer com = Completer();
    mqtt.MessageUtils.wsSub("${EConfig.ns}/u/%%/asset", (msg) {
      // print(msg);
      try {
        // print("arr");
        var __config = getUserAssetList(
            json.decode(utf8.decode(gzip.decode(msg))) as List<dynamic>? ?? []);
        if (notifySame ||
            json.encode(__config).toString() !=
                json.encode(_config).toString()) {
          _config = __config;
          if (hasListeners) {
            notifyListeners();
          }
        }
        // print("__config:$__config");
        if (!com.isCompleted) {
          com.complete();
        }
      } catch (err) {
        print("err collect spot trade: $err");
      }
    });
    return com.future;
  }

  UserAsset? get usdt {
    return _config.firstWhereOrNull(
        (e) => e.asset.toLowerCase() == "usdt" && e.group == 0);
  }

  UserAsset? getAsset(String asset, int group) {
    return _config.firstWhereOrNull((e) =>
        e.asset.toLowerCase() == asset.toLowerCase() && e.group == group);
  }

  List<UserAsset> get config {
    return _config;
  }

  void notifyChange() {
    if (hasListeners) {
      notifyListeners();
    }
  }

  static void loginOutStatic() {
    _last?._config = [];
    _last?.ready = false;
  }
}
