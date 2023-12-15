import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Buyticket/trainspace_line.dart';
import 'package:flutter_application_1/little/dialog/loginconfirm.dart';
import 'package:flutter_application_1/little/dialog/success.dart';
import 'package:flutter_application_1/widget/http.dart';
import 'package:flutter_application_1/widget/user_model.dart';
import 'package:provider/provider.dart';

void buyit(int num) async {
  await Http.buy(num);
  // await Dio().get('https://jsonplaceholder.typicode.com/photos');
  // // var u = json.decode(response.toString());
}

class Passengerbuydouble extends StatefulWidget {
  List<int> passenger = [];
  int ticketnum1;
  int ticketnum2;
  // ignore: non_constant_identifier_names
  Passengerbuydouble(
      {Key? key, required this.ticketnum1, required this.ticketnum2})
      : super(key: key);
  @override
  _PassengerbuydoubleState createState() => _PassengerbuydoubleState();
}

class _PassengerbuydoubleState extends State<Passengerbuydouble> {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserModel>(context);
    return Container(
      color: Colors.teal[400],
      child: Column(
        children: [
          spaceline(spacing: 10.0),
          MaterialButton(
            onPressed: () {},
            color: Colors.white,
            child: Row(
              children: [Icon(Icons.control_point), Text('选择乘车人')],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
            child: FlatButton(
              onPressed: () {
                if (_user.isLogin) {
                  buyit(widget.ticketnum1);
                  buyit(widget.ticketnum2);
                  Navigator.pop(context);
                  successfirm(context, '购票');
                } else {
                  loginconfirm(context);
                }
              },
              shape: StadiumBorder(
                side: BorderSide(
                  width: 2,
                  // style: BorderStyle.solid,
                  style: BorderStyle.none,
                ),
              ),
              minWidth: 160,
              height: 50,
              child: Text(
                '点击购票',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              color: Colors.blue[600],
            ),
          )
        ],
      ),
    );
  }
}
