import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/transfer/transferview.dart';

class TransferCard extends StatelessWidget {
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
  TransferCard(
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
    return ListTile(
      leading: Icon(Icons.train),
      title: Text(
        startsation + ' ==> ' + middlestation + ' ==> ' + endstation,
      ),
      subtitle: Text(starttime1 +
          ' ---' +
          endtime1 +
          '   ' +
          starttime2 +
          '---' +
          endtime2),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return new TransferView(
              startsation: startsation,
              middlestation: middlestation,
              endstation: endstation,
              endtime1: endtime1,
              starttime1: starttime1,
              endtime2: endtime2,
              starttime2: starttime2,
              price1: price1,
              price2: price2,
              id1: id1,
              id2: id2,
              trainid1: trainid1,
              trainid2: trainid2);
        }));
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 2.0),
    );
  }
}
