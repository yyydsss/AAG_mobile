import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/Buyticket/buyticket.dart';
import 'package:flutter_application_1/little/loading/loading.dart';
import 'package:flutter_application_1/transfer/transferpage.dart';
import 'package:flutter_application_1/widget/http.dart';

Future<Response> getHttp(String start, String end) async {
  var response = await Http.tickets(start, end);
  // await Dio().get('https://jsonplaceholder.typicode.com/photos');
  // // var u = json.decode(response.toString());
  for (var item in response.data) {
    print(item['title']);
  }
  return response;
}

List<Widget> tiles = [];

class Searchres extends StatefulWidget {
  final String start;
  String end;
  String time;
  // ignore: non_constant_identifier_names
  Searchres(
      {Key? key, required this.start, required this.end, required this.time})
      : super(key: key);
  @override
  _SearchresState createState() => _SearchresState();
}

class _SearchresState extends State<Searchres> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[200],
        appBar: AppBar(
          title: Text('车票查询结果'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            children: [
              Text(widget.time),
              FutureBuilder(
                future: getHttp(widget.start, widget.end),
                builder:
                    (BuildContext context, AsyncSnapshot<Response> snapshot) {
                  List<Widget> tiles = [];
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

                          ListTile(
                        leading: Icon(Icons.train),
                        title: Text(widget.start +
                            ' ==> ' +
                            widget.end +
                            '    ID:' +
                            '1234567'),
                        subtitle: Text('发车: 11:00' +
                            ' ---' +
                            "到达: 14:00" +
                            '   ' +
                            'G5302'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return new Buyticket(
                              id: 123,
                            );
                          }));
                        },
                        contentPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      );
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
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return new Transferpage(
                          start: widget.start,
                          end: widget.end,
                          time: widget.time);
                    }));
                  },
                  child: Text(
                    '显示中转方案',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ));
  }
}
