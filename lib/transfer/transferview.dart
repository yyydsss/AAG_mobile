import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Buyticket/ticket.dart';
import 'package:flutter_application_1/Buyticket/ticketpassenger.dart';
import 'package:flutter_application_1/Buyticket/ticketpassenger_double.dart';

class TransferView extends StatelessWidget {
  String startsation;
  String middlestation;
  String endstation;
  String starttime1;
  String endtime1;
  String starttime2;
  String endtime2;
  String trainid1;
  String trainid2;
  int price1;
  int price2;
  int id1;
  int id2;
  TransferView(
      {Key? key,
      required this.startsation,
      required this.middlestation,
      required this.endstation,
      required this.endtime1,
      required this.starttime1,
      required this.endtime2,
      required this.starttime2,
      required this.price1,
      required this.price2,
      required this.id1,
      required this.id2,
      required this.trainid1,
      required this.trainid2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Ticketinfo(
            startsation: startsation,
            endstation: middlestation,
            endtime: endtime1,
            starttime: starttime1,
            trainid: trainid1,
            price: price1),
        Ticketinfo(
            startsation: middlestation,
            endstation: endstation,
            endtime: endtime2,
            starttime: starttime2,
            trainid: trainid2,
            price: price2),
        Passengerbuydouble(ticketnum1: id1, ticketnum2: id2)
      ],
    ));
  }
}
