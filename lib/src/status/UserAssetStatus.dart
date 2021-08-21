import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../config.dart';
import '../ext.dart';
import '../entrys/user_asset.dart';
import 'package:flutter/material.dart';
import 'package:mqtt/mqtt.dart' as mqtt;

class UserAssetStatus with ChangeNotifier {
  List<UserAsset> _config = [UserAsset("usdt", 100, 0)];
  Future<void> init() {
    Completer com = Completer();
    mqtt.MessageUtils.wsSub("$EConfig.CONFIG_PNAME/u/%%/asset", (msg) {
      // print(msg);
      try {
        var __config = getUserAssetList(
            json.decode(utf8.decode(gzip.decode(msg))) as List<dynamic>? ?? []);
        if (json.encode(__config).toString() !=
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
        print("err collect spot trade: $err");
      }
    });
    return com.future;
  }

  UserAsset? get usdt {
    return _config.firstWhereOrNull((e) => e.asset.toLowerCase() == "usdt");
  }

  List<UserAsset> get config {
    return _config;
  }

  void notifyChange() {
    if (hasListeners) {
      notifyListeners();
    }
  }
}
