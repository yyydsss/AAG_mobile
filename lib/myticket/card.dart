import 'package:flutter/material.dart';
import 'package:flutter_application_1/myticket/ticketview.dart';
import 'package:flutter_application_1/widget/user_model.dart';
import 'package:provider/provider.dart';

class Mycard extends StatefulWidget {
  final callback;
  String trainid;
  String start;
  String end;
  String starttime;
  String endtime;
  int price;
  int orderid;
  int ticketid;
  int state;
  Mycard(
      {Key? key,
      required this.trainid,
      required this.start,
      required this.end,
      required this.endtime,
      required this.orderid,
      required this.ticketid,
      required this.price,
      required this.starttime,
      required this.state,
      this.callback})
      : super(key: key);
  @override
  _MycardState createState() => _MycardState();
}

class _MycardState extends State<Mycard> {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserModel>(context);
    // TODO: implement build
    return new SizedBox(
      height: 210.0, //设置高度
      child: new Card(
          elevation: 15.0, //设置阴影
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0))), //设置圆角
          child: Container(
            color: widget.state == 1 ? Colors.white : Colors.black12,
            child: new Column(
              // card只能有一个widget，但这个widget内容可以包含其他的widget
              children: [
                new ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return new TickView(
                        startsation: widget.start,
                        endstation: widget.end,
                        endtime: widget.endtime,
                        starttime: widget.starttime,
                        ticketid: widget.ticketid,
                        orderid: widget.orderid,
                        trainid: widget.trainid,
                        price: widget.price,
                        state: widget.state,
                      );
                    })).then((data) => {
                          setState(() {
                            widget.callback;
                            // 也可以将状态修改写在这个函数参数里
                            // clickTime ++;
                          })
// 判断是否刷新
                        });
                  },
                  title: widget.state == 1
                      ? new Text('乘车人:' + _user.username + '  Date:2021/07/19',
                          style: new TextStyle(fontWeight: FontWeight.w500))
                      : new Text(
                          _user.username + '  Date:2021/07/19' + ' 已改签或退票',
                          style: new TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: new Text('票价:' + widget.price.toString()),
                  leading: new Icon(
                    Icons.restaurant_menu,
                    color: Colors.yellow[500],
                  ),
                ),
                new Divider(),
                new ListTile(
                  title: new Text(
                      '出发地:' + widget.start + '  出发时间:' + widget.starttime,
                      style: new TextStyle(fontWeight: FontWeight.w500)),
                  leading: new Icon(
                    Icons.contact_phone,
                    color: Colors.yellow[500],
                  ),
                ),
                new ListTile(
                  title: new Text(
                      '目的地:' + widget.end + '  到达时间:' + widget.endtime),
                  leading: new Icon(
                    Icons.contact_mail,
                    color: Colors.yellow[500],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
