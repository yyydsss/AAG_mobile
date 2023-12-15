import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_application_1/change/changepage.dart';
import 'package:flutter_application_1/widget/http.dart';

void returnit(int num) async {
  await Http.refund(num);
  // await Dio().get('https://jsonplaceholder.typicode.com/photos');
  // // var u = json.decode(response.toString());
}

void buyit(int num) async {
  await Http.buy(num);
  // await Dio().get('https://jsonplaceholder.typicode.com/photos');
  // // var u = json.decode(response.toString());
}

enum Action { Ok, Cancel }
Future changeit(BuildContext context, int orderid, int ticketid) async {
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
      returnit(orderid);
      buyit(ticketid);
      Navigator.pop(context);
      break;
    case Action.Cancel:
      break;
    default:
  }
}
