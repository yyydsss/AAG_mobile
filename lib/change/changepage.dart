import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/change/changecard.dart';
import 'package:flutter_application_1/little/loading/loading.dart';
import 'package:flutter_application_1/transfer/transfercard.dart';
import 'package:flutter_application_1/widget/http.dart';

Future<Response> getHttptransfer(String start, String end) async {
  var response = await Http.tickets(start, end);
  // await Dio().get('https://jsonplaceholder.typicode.com/photos');
  // // var u = json.decode(response.toString());
  for (var item in response.data) {
    print(item['title']);
  }
  return response;
}

List<Widget> tiles = [];

class Changepage extends StatefulWidget {
  String start;
  String end;
  String time;
  int orderid;
  // ignore: non_constant_identifier_names
  Changepage(
      {Key? key,
      required this.start,
      required this.end,
      required this.time,
      required this.orderid})
      : super(key: key);
  @override
  _ChangepageState createState() => _ChangepageState();
}

class _ChangepageState extends State<Changepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[200],
        appBar: AppBar(
          title: Text('中转查询结果'),
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
                  if (snapshot.hasData) {
                    Response? response = snapshot.data;
                    for (var item in response!.data) {
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

                          changecard(
                              trainid: item['train'],
                              start: widget.start,
                              end: widget.end,
                              endtime: item['endTime'],
                              ticketid: item['id'],
                              orderid: widget.orderid,
                              price: 200,
                              starttime: item['startTime']);
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
