import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_application_1/change/changepage.dart';

enum Action { Ok, Cancel }
Future Changeopen(BuildContext context, String start, String end, String time,
    int orderid) async {
  final action = await showDialog(
    context: context,
    barrierDismissible: false, //// user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('改签确认'),
        content: Text('是否改签?'),
        actions: <Widget>[
          FlatButton(
            child: Text('取消'),
            onPressed: () {
              Navigator.pop(context, Action.Cancel);
            },
          ),
          FlatButton(
            child: Text('确认'),
            onPressed: () {
              Navigator.pop(context, Action.Ok);
            },
          ),
        ],
      );
    },
  );

  switch (action) {
    case Action.Ok:
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return new Changepage(
            start: start, end: end, time: time, orderid: orderid);
      }));
      break;
    case Action.Cancel:
      break;
    default:
  }
}
