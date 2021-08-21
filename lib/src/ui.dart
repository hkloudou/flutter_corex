import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

Future<void> alert(BuildContext context, String tip,
    {bool? isDarkMode,
    bool canDismiss = false,
    bool cancelBtn = false,
    VoidCallback? cb,
    String okText = "",
    String canCelText = ""}) async {
  Completer completer = new Completer();
  // Localizations.of(context, type)
  if (okText == "") {
    okText =
        Localizations.of<MaterialLocalizations>(context, MaterialLocalizations)
                ?.okButtonLabel ??
            "确定";
  }
  if (canCelText == "") {
    canCelText =
        Localizations.of<MaterialLocalizations>(context, MaterialLocalizations)
                ?.cancelButtonLabel ??
            "取消";
  }
  showDialog(
    context: context,
    barrierDismissible: canDismiss || cancelBtn, // user must tap button!
    builder: (BuildContext context) {
      return Theme(
        data: Theme.of(context),
        child: WillPopScope(
            onWillPop: () async {
              return Future.value(canDismiss || cancelBtn);
            },
            child: AlertDialog(
              // title: Text('下单状态'),
              content: Text(tip),
              actions: <Widget>[
                (cancelBtn)
                    ? TextButton(
                        child: Text(canCelText),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    : Container(),
                TextButton(
                  child: Text(okText),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (!completer.isCompleted) {
                      completer.complete();
                    }
                    if (cb != null) {
                      cb();
                    }
                  },
                ),
              ],
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            )),
      );
    },
  );
  return completer.future;
}

bool _isShowing = false;

void showProgress(
  BuildContext context, {
  // // Widget child = const CircularProgressIndicator(
  // //   valueColor: AlwaysStoppedAnimation(AppConfig.colorPrimary),
  // ),
  Widget? child,
  bool? isDarkMode,
  String? text,
}) {
  if (child == null) {
    child = CircularProgressIndicator();
  }
  showDialog(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return Theme(
        data: Theme.of(context),
        child: WillPopScope(
          onWillPop: () async {
            return Future.value(false);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              child!,
              // Text(tip),
              text == null
                  ? Container()
                  : DefaultTextStyle(
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          color: Colors.white),
                      child: Text(text),
                    )
            ],
          ),
        ),
      );
    },
  );
  _isShowing = true;
  // _allowPop = false;
}

void hideProgress(BuildContext context) {
  if (_isShowing) {
    Navigator.of(context).pop();
    _isShowing = false;
  }
}
