import 'package:flutter/material.dart';
import 'package:flutter_application_1/little/dialog/dialog.dart';
import 'package:flutter_application_1/search/Datepick.dart';
import 'package:flutter_application_1/little/stationpicker/stationpicker.dart';
import 'package:flutter_application_1/search/example.dart';
import 'package:flutter_application_1/search/map.dart';
import 'package:flutter_application_1/search/search_res.dart';

class PreSearch extends StatefulWidget {
  _PreSearchState createState() => _PreSearchState();
}

class _PreSearchState extends State<PreSearch> {
  String start = '出发站点';
  String end = '目的站点';
  String date = '选择时间';

  void setLocation1(String city) {
    setState(() {
      if (city != null) start = city;
    });
  }

  void setLocation2(String city) {
    setState(() {
      if (city != null) end = city;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(
          child: SizedBox(
        height: 600,
        width: 400,
        child: new Container(
            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
            child: Center(
              child: SizedBox(
                  width: 375,
                  height: 575,
                  child: Center(
                    child: new Container(
                      decoration: ShapeDecoration(
                        color: Colors.green[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Searchtitle(),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 5, right: 5, top: 15, bottom: 15),
                            child: DatePickerDemo(
                              callback: (time) {
                                setState(() {
                                  date = time;
                                });
                                print(date);
                                print(start);
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MaterialButton(
                                  height: 50,
                                  color: Colors.green,
                                  child: Text(
                                    start,
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    print('ss');
                                    Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new SelectCityField()),
                                    ).then((txt) {
                                      setLocation1(txt);
                                    });
                                  }),
                              Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                              Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                              Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                              MaterialButton(
                                  height: 50,
                                  color: Colors.green,
                                  child: Text(
                                    end,
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    print('ss');
                                    Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new SelectCityField()),
                                    ).then((txt) {
                                      setLocation2(txt);
                                    });
                                  })
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 5, right: 5, top: 15, bottom: 15),
                            child: MaterialButton(
                                height: 70,
                                minWidth: 250,
                                color: Colors.green,
                                child: Text(
                                  '获取一站式出行方案',
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                onPressed: () {
                                  if (start == '出发站点' ||
                                      end == '目的站点' ||
                                      date == '选择日期') {
                                    openAlertDialog(context);
                                    return;
                                  }

                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      // return Searchres(
                                      //   start: start,
                                      //   end: end,
                                      //   time: date,
                                      // ); //返回的是需要跳转单页面
                                      return Mymap(
                                        time: this.date,
                                        start: this.start,
                                        end: this.end,
                                      );
                                    },
                                  ));
                                }),
                          )
                        ],
                      ),
                    ),
                  )),
            )),
      )),
    );
  }
}
