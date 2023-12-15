import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/little/loading/loading.dart';
import 'package:flutter_application_1/widget/http.dart';

import 'card.dart';

Future<Response> mytHttp() async {
  var response = await Http.orders();
  // await Dio().get('https://jsonplaceholder.typicode.com/photos');
  // // var u = json.decode(response.toString());
  for (var item in response.data) {
    print(item['title']);
  }
  return response;
}

// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("查询车票"),
//       ),
//       body: Center(
//         child: RaisedButton(
//           child: Text("返回到第一页"),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }
// }
class mycard extends StatefulWidget {
  mycard({required this.title});

  final String title;

  @override
  _mycardstate createState() => _mycardstate();
}

class _mycardstate extends State<mycard> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return FutureBuilder(
      future: mytHttp(),
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        List<Widget> tiles = [];
        if (!snapshot.hasData) {
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

                Mycard(
                    trainid: item['train_id'].toString(),
                    start: item['start_station'].toString(),
                    end: item['end_station'].toString(),
                    endtime: item['end_time'].toString(),
                    orderid: item['order_id'],
                    ticketid: item['id'],
                    price: item['price'],
                    state: item['state'],
                    starttime: item['start_time'].toString(),
                    callback: () => setState(() {}));

            // onTap: () {
            //   Navigator.push(context, MaterialPageRoute(builder: (_) {
            //     return new Buyticket(
            //       id: item['id'],
            //     );
            //   }));
            // },
            // contentPadding: EdgeInsets.symmetric(horizontal: 2.0),

            tiles.add(value);
          }
          return Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              height: 800.0,
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
              padding: EdgeInsetsDirectional.fromSTEB(10, 200, 10, 50),
              child: Center(
                child: childWidget(),
              ));
        }
      },
    );
    // Scaffold(
    //     body: Center(
    //   child: SingleChildScrollView(
    //       child: Container(
    //     padding: const EdgeInsets.all(20.0),
    //     child: Column(
    //       children: [
    //         Padding(
    //           padding: EdgeInsets.only(bottom: 20.0),
    //           child: Container(
    //               padding: const EdgeInsets.all(10.0),
    //               decoration: new BoxDecoration(
    //                 color: Colors.yellow,
    //                 //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
    //                 borderRadius: BorderRadius.all(Radius.circular(25.0)),
    //                 border:
    //                     new Border.all(width: 3, color: Colors.yellow.shade600),
    //               ),
    //               child: card()),
    //         ),
    //       ],
    //     ),
    //   )),
    // ));
  }
}
