import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

typedef MarkDownCallBack = Future<String> Function(
    {String url, CancelToken? cancelToken});

class EConfig {
  // static Map<String,>
  static String ns = "test";
  static List<String> mqttServer = ["ws://127.0.0.1:9094/ws"];
  static VoidCallback? onMQTTChanged;
  static String nameSafetyBond = "保障金";
  static Future<String> Function({String url, CancelToken? cancelToken})?
      diomarkdown;
  static String getAssetName(String asset) {
    if (asset.toLowerCase() == "vorcher") {
      return "点卡";
    } else if (asset.toLowerCase() == "safetybond") {
      return nameSafetyBond;
    }
    return asset;
  }
}

class EColor {
  //主要文字
  static Color main = Color(0xFF303133);
  //nomail
  static Color normal = Color(0xFF606266);
  //nomail
  static Color second = Color(0xFF909399);
  //placehold
  static Color placehilder = Color(0xFFC0C4CC);

  static Color border1 = Color(0xFFDCDFE6);
  static Color border2 = Color(0xFFE4E7ED);
  static Color border3 = Color(0xFFEBEEF5);
  static Color border4 = Color(0xFFF2F6FC);

  static Color success = Color(0xFF67C23A);
  static Color success1 = Color.fromRGBO(225, 243, 216, 255);
  static Color success2 = Color.fromRGBO(240, 249, 235, 255);

  static Color warning = Color(0xFFE6A23C);
  static Color warning1 = Color.fromRGBO(250, 236, 216, 255);
  static Color warning2 = Color.fromRGBO(253, 246, 236, 255);

  static Color danger = Color(0xFFF56C6C);
  static Color danger1 = Color.fromRGBO(253, 226, 226, 255);
  static Color danger2 = Color.fromRGBO(254, 240, 240, 255);

  static Color info = Color(0xFF909399);
  static Color info1 = Color.fromRGBO(233, 233, 235, 255);
  static Color info2 = Color.fromRGBO(244, 244, 245, 255);

  // static const int _orangePrimaryValue = 0xFFf5bb05;
  // static const MaterialColor myorange = MaterialColor(
  //   _orangePrimaryValue,
  //   <int, Color>{
  //     50: Color(0xFFFFF3E0),
  //     100: Color(0xFFFFE0B2),
  //     200: Color(0xFFFFCC80),
  //     300: Color(0xFFFFB74D),
  //     400: Color(0xFFFFA726),
  //     500: Color(_orangePrimaryValue),
  //     600: Color(0xFFFB8C00),
  //     700: Color(0xFFF57C00),
  //     800: Color(0xFFEF6C00),
  //     900: Color(0xFFE65100),
  //   },
  // );
}
