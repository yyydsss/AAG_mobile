import 'package:flutter/material.dart';
import 'dart:async';

Future successfirm(BuildContext context, String work) async {
  final action = await showDialog(
    context: context,
    barrierDismissible: false, //// user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('提示'),
        content: Text(work + '成功，点击返回'),
        actions: <Widget>[
          FlatButton(
            child: Text('好的:)'),
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
