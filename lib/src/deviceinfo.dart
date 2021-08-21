// part of flutter_uibox;
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'packageinfo.dart';

String _deviceID = "";
final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

Future<void> initDeviceID() async {
  print("corex:initDeviceID");
  try {
    if (Platform.isAndroid) {
      var andinfo = (await _deviceInfoPlugin.androidInfo);
      _deviceID = andinfo.androidId;
    } else if (Platform.isIOS) {
      _deviceID = (await _deviceInfoPlugin.iosInfo).identifierForVendor;
    }
  } on PlatformException catch (err) {
    print("corex:initPlatformState:${err.toString()}");
  } catch (err) {
    print("corex:initDeviceID err: $err");
  }
  print("corex:_deviceID:$_deviceID");
  if (_deviceID == "") {
    return SharedPreferences.getInstance().then((hand) {
      print("corex:_deviceID hand");
      var key = packageInfo.packageName + "/deviceID";
      String value = hand.getString(key) ?? "";
      if (value.isEmpty) {
        value = Uuid().v4();
      }
      _deviceID = value;
      return hand.setString(key, value);
    });
  }
  return Future.value();
}

String get deviceID {
  return _deviceID;
}
