import 'package:flutter/material.dart';
import 'dart:async';

Future loginconfirm(BuildContext context) async {
  final action = await showDialog(
    context: context,
    barrierDismissible: false, //// user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('提示'),
        content: Text('请先登录！'),
        actions: <Widget>[
          FlatButton(
            child: Text('我知道了:)'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // FlatButton(
          //   child: Text('确认'),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      );
    },
  );
}
