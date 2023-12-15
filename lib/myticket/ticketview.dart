import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Buyticket/trainspace_line.dart';
import 'package:flutter_application_1/change/changeview.dart';
import 'package:flutter_application_1/little/dialog/openchange.dart';
import 'package:flutter_application_1/little/dialog/returnconfirm.dart';
import 'package:flutter_application_1/widget/user_model.dart';
import 'package:provider/provider.dart';

class TickView extends StatelessWidget {
  String startsation;
  String endstation;
  String starttime;
  String endtime;
  String trainid;
  int price;
  int orderid;
  int ticketid;
  int state;
  TickView(
      {Key? key,
      required this.startsation,
      required this.endstation,
      required this.endtime,
      required this.starttime,
      required this.trainid,
      required this.price,
      required this.orderid,
      required this.ticketid,
      required this.state})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('车票详情'),
      ),
      body: Container(
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
              SizedBox(
                width: 400,
                height: 300,
                child: Container(
                  child: Center(
                    child: Text('显示乘车人'),
                  ),
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: FlatButton(
                      onPressed: state == 1
                          ? () {
                              Changeopen(context, startsation, endstation,
                                      '这里是日期', orderid)
                                  .then((value) => null);
                            }
                          : null,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.white,
                      shape: StadiumBorder(
                        side: BorderSide(
                          width: 2,
                          // style: BorderStyle.solid,
                          style: BorderStyle.none,
                        ),
                      ),
                      minWidth: 130,
                      height: 50,
                      child: Text(
                        '改签',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.blue[600],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: FlatButton(
                      onPressed: state == 1
                          ? () {
                              refund(context, orderid, _user.f);
                            }
                          : null,
                      disabledTextColor: Colors.white,
                      disabledColor: Colors.grey,
                      shape: StadiumBorder(
                        side: BorderSide(
                          width: 2,
                          // style: BorderStyle.solid,
                          style: BorderStyle.none,
                        ),
                      ),
                      minWidth: 130,
                      height: 50,
                      child: Text(
                        '退票',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.red[300],
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
