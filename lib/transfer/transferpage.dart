import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/little/loading/loading.dart';
import 'package:flutter_application_1/transfer/transfercard.dart';
import 'package:flutter_application_1/widget/http.dart';

Future<Response> getHttptransfer(String start, String end) async {
  var response = await Http.transfer(start, end);
  // await Dio().get('https://jsonplaceholder.typicode.com/photos');
  // // var u = json.decode(response.toString());
  print(response);
  return response;
}

List<Widget> tiles = [];

class Transferpage extends StatefulWidget {
  String start;
  String end;
  String time;
  // ignore: non_constant_identifier_names
  Transferpage(
      {Key? key, required this.start, required this.end, required this.time})
      : super(key: key);
  @override
  _TransferpageState createState() => _TransferpageState();
}

class _TransferpageState extends State<Transferpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[200],
        appBar: AppBar(
          title: Text('中转查询结果' + widget.start + widget.end),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            children: [
              Text(widget.time),
              FutureBuilder(
                future: getHttptransfer(widget.start, widget.end),
                builder:
                    (BuildContext context, AsyncSnapshot<Response> snapshot) {
                  List<Widget> tiles = [];
                  print(snapshot.connectionState);
                  print(snapshot.hasData);
                  if (!snapshot.hasData) {
                    Response? response = snapshot.data;
                    for (var item in [1, 2, 3, 4, 5]) {
                      Widget value =
                          // ListTile(
                          //   leading: Icon(Icons.train),
                          //   title: Text('ss'),
                          //   subtitle: Text('ss'),
                          //   trailing: Icon(Icons.keyboard_arrow_right),
                          //   onTap: () {
                          //     Navigator.push(context, MaterialPageRoute(builder: (_) {
                          //       return new FirstPage();
                          //     }));
                          //   },
                          //   contentPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          // );

                          TransferCard(
                              startsation: widget.start,
                              middlestation: '中转站',
                              endstation: widget.end,
                              endtime1: '11:00',
                              starttime1: '9:00',
                              endtime2: '14:30',
                              starttime2: '11:30',
                              price1: 180,
                              price2: 210,
                              id1: 112233,
                              id2: 334455,
                              trainid1: 'G304',
                              trainid2: 'K555');
                      tiles.add(value);
                    }
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: SizedBox(
                        height: 450.0,
                        child: Container(
                            color: Colors.white,
                            child: new ListView(
                              padding: const EdgeInsets.all(10.0),
                              children: tiles,
                            )),
                      ),
                    );
                  } else {
                    return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10, 200, 10, 50),
                        child: Center(
                          child: childWidget(),
                        ));
                  }
                },
              ),
            ],
          ),
        ));
  }
}
