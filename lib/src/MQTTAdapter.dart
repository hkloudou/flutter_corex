//System
import 'dart:async';
import 'dart:math';

//Third Part
import 'package:corex/corex.dart';
import 'package:mqtt/mqtt.dart' as mqtt;

//Self
import './config.dart';
import './deviceinfo.dart';
import './status/AuthStatus.dart';

class MQTTAdapter {
  static bool inited = false;
  static bool screenPaused = false;
  // static String _url = CONFIG_MQTT_SERVER;
  // static String _url = "ws://127.0.0.1:9094/ws";

  ///"wss://broker.app.abcexapp.com/ws"
  // static String _url = "wss://broker.app.abcexapp.com/ws";

  static void reset() {
    // onMQTTChanged
    UserAssetStatus.loginOutStatic();
    EConfig.onMQTTChanged?.call();
  }

  static void setAuthInfo() {
    reset();
    // print("resetAuthInfo");
    if (AuthStatus.isLoginStatic) {
      print("：：-》密码登录");
      mqtt.MessageUtils.connectMsg
          .withAuth(AuthStatus.userNameStatic, AuthStatus.tokenStatic);
    } else {
      print("：：-》无认证");
      mqtt.MessageUtils.connectMsg.withAuth(null, null);
    }
  }

  static void reConnect() {
    setAuthInfo();
    mqtt.MessageUtils.connect(
        EConfig.mqttServer
            .elementAt(new Random().nextInt(EConfig.mqttServer.length)),
        re: true);
  }

  static void closeSocket() {
    mqtt.MessageUtils.closeSocket();
  }

  static Future init() async {
    if (inited) return Future.error("re inited");
    inited = true;
    mqtt.MessageUtils.connectMsg.withClientID(deviceID);
    mqtt.MessageUtils.onConnected = (mqtt.MqttConnectReturnCode ret) {
      print("on Onnect");
      reset();
      if (ret == mqtt.MqttConnectReturnCode.badUsernameOrPassword) {
        AuthStatus.loginOutStatic();
        print("loginOut");
      }
      /*else {
        EConfig.onMQTTChanged?.call();
      }*/
      // print("data reset");
      mqtt.MessageUtils.subAllUnfinished();
    };
    mqtt.MessageUtils.onDisConnected = () {
      if (screenPaused) return;
      // print("dis Connected");
      Timer(Duration(seconds: 1), () {
        reConnect();
      });
    };
    reConnect();
  }
}
