import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'package:mqtt/mqtt.dart' as mqtt;
import '../config.dart';
import '../packageinfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStatus with ChangeNotifier {
  static String? _userName;
  static Uint8List? _token;
  static AuthStatus? _last;

  AuthStatus() {
    _last = this;
  }
  String get userName {
    return _userName ?? "";
  }

  Uint8List get token {
    return _token ?? Uint8List.fromList([]);
  }

  bool get isLogin {
    return _token != null;
  }

  static bool get isLoginStatic {
    return _token != null;
  }

  static String get userNameStatic {
    return _userName ?? "";
  }

  static Uint8List? get tokenStatic {
    return _token;
  }

  static Future loginOutStatic() {
    if (_last != null) {
      return _last!.loginOut();
    }
    return SharedPreferences.getInstance().then((hand) {
      return Future.wait([
        hand.remove(packageInfo.packageName + "/lt_userName"),
        hand.remove(packageInfo.packageName + "/lt_token"),
      ]).then((_) {
        _userName = null;
        _token = null;
        return mqtt.MessageUtils.closeSocket(); //关闭socker来自动重制数据
      }).catchError((err) {
        print("loginOut error:${err.toString()}");
      });
    }).whenComplete(() {
      // print("notifyListeners");
      // notifyListeners();
    });
  }

  Future<void> init() async {
    return SharedPreferences.getInstance().then((hand) {
      try {
        var key = packageInfo.packageName + "/lt_token";
        _userName =
            hand.getString(packageInfo.packageName + "/lt_userName") ?? "";
        _token = base64Decode(hand.getString(key) ?? "");
        if (_token != null && _token!.length < 10) {
          _token = null;
        }
      } catch (e) {
        _userName = null;
        _token = null;
      }
      return Future.value();
    }).catchError((_) {
      _userName = null;
      _token = null;
    });
  }

  Future<void> login(String userName, Uint8List token) async {
    return SharedPreferences.getInstance()
        .then((hand) => Future.wait([
              hand.setString(
                  packageInfo.packageName + "/lt_userName", userName),
              hand.setString(
                  packageInfo.packageName + "/lt_token", base64Encode(token))
            ]).then((_) {
              EConfig.onMQTTChanged?.call();
            }).then((_) {
              _userName = userName;
              _token = token;
              return mqtt.MessageUtils.closeSocket(); //登陆成功，关闭链接重连
            }))
        .whenComplete(() {
      notifyListeners();
    });
  }

  Future<void> loginOut() async {
    return SharedPreferences.getInstance().then((hand) {
      return Future.wait([
        hand.remove(packageInfo.packageName + "/lt_userName"),
        hand.remove(packageInfo.packageName + "/lt_token"),
      ]).then((_) {
        EConfig.onMQTTChanged?.call();
      }).then((_) {
        _userName = null;
        _token = null;
        // return MQTTAdapter.resetAuthConnect();
        return mqtt.MessageUtils.closeSocket();
      }).catchError((err) {
        print("loginOut error:${err.toString()}");
      });
    }).whenComplete(() {
      // print("notifyListeners");
      notifyListeners();
    });
  }
}
