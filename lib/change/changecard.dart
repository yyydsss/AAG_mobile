import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/myticket/ticketview.dart';
import 'package:flutter_application_1/widget/user_model.dart';
import 'package:provider/provider.dart';

import 'changeview.dart';

class changecard extends StatelessWidget {
  String trainid;
  String start;
  String end;
  String starttime;
  String endtime;
  int price;
  int ticketid;
  int orderid;
  changecard({
    Key? key,
    required this.trainid,
    required this.start,
    required this.end,
    required this.endtime,
    required this.orderid,
    required this.ticketid,
    required this.price,
    required this.starttime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserModel>(context);
    // TODO: implement build
    return new ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return new ChangeView(
            startsation: start,
            endstation: end,
            endtime: endtime,
            starttime: starttime,
            trainid: trainid,
            price: price,
            ticketid: ticketid,
            orderid: orderid,
          );
        }));
      },
      title: new Text(start + ' ==> ' + end + '  ' + trainid,
          style: new TextStyle(fontWeight: FontWeight.w500)),
      subtitle: new Text(
          '票价:' + price.toString() + ' ' + starttime + '---' + endtime),
      leading: new Icon(
        Icons.restaurant_menu,
        color: Colors.yellow[500],
      ),
    );
  }
}
