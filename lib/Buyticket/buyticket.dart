import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Buyticket/seatbox.dart';
import 'package:flutter_application_1/Buyticket/ticket.dart';
import 'package:flutter_application_1/Buyticket/ticketpassenger.dart';
import 'package:flutter_application_1/little/loading/loading.dart';
import 'package:flutter_application_1/widget/http.dart';

Future<Response> getHttp(int id) async {
  var response =
      // await Dio().get('http://192.168.1.235:8080/tickets?start=北京&end=唐山北');
      await Http.ticket(id);
  // // var u = json.decode(response.toString());

  return response;
}

class Buyticket extends StatefulWidget {
  int index = 2;
  int id;
  // ignore: non_constant_identifier_names
  Buyticket({Key? key, required this.id}) : super(key: key);
  @override
  _BuyticketState createState() => _BuyticketState();
}

class _BuyticketState extends State<Buyticket> {
  // String start;
  // String end;
  // String starttime;
  // String endtime;
  // String trainid;
  // int price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          backgroundColor: Colors.teal[300],
          centerTitle: true,
          title: Text("确认订单"),
        ),
        body: FutureBuilder(
          future: getHttp(widget.id),
          builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
            List<Widget> tiles = [];
            if (!snapshot.hasData) {
              Response? response = snapshot.data;

              return Column(
                children: [
                  Ticketinfo(
                    startsation: '始发站',
                    endstation: '终点站',
                    starttime: '9:00',
                    endtime: '11:00',
                    trainid: 'G304',
                    price: 220,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [Text('G1087 次列车')],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [Text('始发站:上海'), Text('          '), Text('目的地:北京')],
                  // ),
                  new Container(
                    color: Colors.white,
                    child: new Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(widget.id.toString()),
                          Container(
                            height: 90,
                            width: 90,
                            decoration: new BoxDecoration(
                              color: widget.index == 0
                                  ? Colors.blue[600]
                                  : Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: new Seatbox(
                                click: widget.index == 0 ? true : false,
                                count: '35' + '张',
                                title: '商务座',
                                onPressed: () {
                                  setState(() {
                                    if (widget.index == 0) return;
                                    widget.index = 0;
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: 90,
                            width: 90,
                            decoration: new BoxDecoration(
                              color: widget.index == 1
                                  ? Colors.blue[600]
                                  : Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: new Seatbox(
                                click: widget.index == 1 ? true : false,
                                count: '110' + '张',
                                title: '一等座',
                                onPressed: () {
                                  setState(() {
                                    if (widget.index == 1) return;
                                    widget.index = 1;
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: 90,
                            width: 90,
                            decoration: new BoxDecoration(
                              color: widget.index == 2
                                  ? Colors.blue[600]
                                  : Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: new Seatbox(
                                click: widget.index == 2 ? true : false,
                                count: '210' + '张',
                                title: '二等座',
                                onPressed: () {
                                  setState(() {
                                    if (widget.index == 2) return;
                                    widget.index = 2;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Passengerbuy(
                    ticketnum: widget.id,
                  )
                ],
              );
            } else {
              return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 200, 10, 50),
                  child: Center(
                    child: childWidget(),
                  ));
            }
          },
        ));
    // Column(
    //   children: [
    //     Ticketinfo(),
    //     // Row(
    //     //   mainAxisAlignment: MainAxisAlignment.center,
    //     //   children: [Text('G1087 次列车')],
    //     // ),
    //     // Row(
    //     //   mainAxisAlignment: MainAxisAlignment.center,
    //     //   children: [Text('始发站:上海'), Text('          '), Text('目的地:北京')],
    //     // ),
    //     new Container(
    //       color: Colors.white,
    //       child: new Padding(
    //         padding: const EdgeInsets.only(
    //           top: 10.0,
    //           bottom: 10.0,
    //         ),
    //         child: new Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             Text(widget.id.toString()),
    //             Container(
    //               height: 90,
    //               width: 90,
    //               decoration: new BoxDecoration(
    //                 color:
    //                     widget.index == 0 ? Colors.blue[600] : Colors.white,
    //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //               ),
    //               child: Padding(
    //                 padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
    //                 child: new Seatbox(
    //                   click: widget.index == 0 ? true : false,
    //                   count: '35' + '张',
    //                   title: '商务座',
    //                   onPressed: () {
    //                     setState(() {
    //                       if (widget.index == 0) return;
    //                       widget.index = 0;
    //                     });
    //                   },
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               height: 90,
    //               width: 90,
    //               decoration: new BoxDecoration(
    //                 color:
    //                     widget.index == 1 ? Colors.blue[600] : Colors.white,
    //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //               ),
    //               child: Padding(
    //                 padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
    //                 child: new Seatbox(
    //                   click: widget.index == 1 ? true : false,
    //                   count: '110' + '张',
    //                   title: '一等座',
    //                   onPressed: () {
    //                     setState(() {
    //                       if (widget.index == 1) return;
    //                       widget.index = 1;
    //                     });
    //                   },
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               height: 90,
    //               width: 90,
    //               decoration: new BoxDecoration(
    //                 color:
    //                     widget.index == 2 ? Colors.blue[600] : Colors.white,
    //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //               ),
    //               child: Padding(
    //                 padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
    //                 child: new Seatbox(
    //                   click: widget.index == 2 ? true : false,
    //                   count: '210' + '张',
    //                   title: '二等座',
    //                   onPressed: () {
    //                     setState(() {
    //                       if (widget.index == 2) return;
    //                       widget.index = 2;
    //                     });
    //                   },
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     Passengerbuy()
    //   ],
    // ));
  }
}
