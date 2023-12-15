import 'package:flutter/material.dart';
import 'package:flutter_application_1/Buyticket/trainspace_line.dart';
import 'package:flutter_application_1/search/Datepick.dart';
import '../userdispaly/contact_item.dart';

class Ticketinfo extends StatelessWidget {
  String startsation;
  String endstation;
  String starttime;
  String endtime;
  String trainid;
  int price;
  Ticketinfo(
      {Key? key,
      required this.startsation,
      required this.endstation,
      required this.endtime,
      required this.starttime,
      required this.trainid,
      required this.price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
        ),
        color: Colors.teal[400],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      startsation,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      starttime,
                      style: TextStyle(
                        color: Colors.white70,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      trainid,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 26.5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white60,
                          size: 26.5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white38,
                          size: 26.5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white30,
                          size: 26.5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white24,
                          size: 26.5,
                        ),
                      ],
                    ),
                    Text(
                      '用时' + '5小时45分钟',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 10),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      endstation,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      endtime,
                      style: TextStyle(
                        color: Colors.white70,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              ],
            ),
            spaceline(
              spacing: 26.5,
            ),
          ],
        ));
  }
}
