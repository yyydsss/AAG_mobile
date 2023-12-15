import 'package:flutter/material.dart';
import 'package:flutter_application_1/search/hotellist.dart';
import 'package:flutter_application_1/search/notelist.dart';
import 'package:flutter_application_1/search/overview.dart';
import 'package:flutter_application_1/search/weather.dart';

class Mymap extends StatefulWidget {
  final String start;
  String end;
  String time;
  Mymap({Key? key, required this.start, required this.end, required this.time})
      : super(key: key);
  @override
  _MymapState createState() => _MymapState();
}

class _MymapState extends State<Mymap> {
  late int selectedButtonIndex = 0;
  List<String> imagePaths = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('自驾游方案'),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  imagePaths[selectedButtonIndex], // 替换为你的图片路径
                  fit: BoxFit.cover,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedButtonIndex = 0;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16),
                          primary: selectedButtonIndex == 0
                              ? Colors.blue[300]
                              : Colors.blue[100], // 按钮的内边距
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1小时55分钟',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '122公里 88元',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              '路程最短',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedButtonIndex = 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16),
                          primary: selectedButtonIndex == 1
                              ? Colors.blue[300]
                              : Colors.blue[100], // 按钮的内边距
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1小时38分钟',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '130公里 84元',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              '到达最快',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedButtonIndex = 2;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16),
                          primary: selectedButtonIndex == 2
                              ? Colors.blue[300]
                              : Colors.blue[100], // 按钮的内边距
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2小时34分钟',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '288公里 免费',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              '最省钱',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              // return Searchres(
                              //   start: start,
                              //   end: end,
                              //   time: date,
                              // ); //返回的是需要跳转单页面
                              return Searchres(
                                  start: widget.start,
                                  end: widget.end,
                                  time: widget.time);
                            },
                          ));
                        },
                        child: Card(
                          elevation: 10,
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage('assets/images/train.jpg'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.4),
                                  BlendMode.srcOver,
                                ),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              '铁路购票',
                              style: TextStyle(
                                fontSize: 18, // 设置字体大小
                                fontWeight: FontWeight.bold, // 设置字体粗细
                                color: Colors.white, // 设置字体颜色为白色
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              // return Searchres(
                              //   start: start,
                              //   end: end,
                              //   time: date,
                              // ); //返回的是需要跳转单页面
                              return RedBookPage();
                            },
                          ));
                        },
                        child: Card(
                          elevation: 10,
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage('assets/images/note.jpg'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black26.withOpacity(0.5),
                                  BlendMode.srcOver,
                                ),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              '旅行笔记',
                              style: TextStyle(
                                fontSize: 18, // 设置字体大小
                                fontWeight: FontWeight.bold, // 设置字体粗细
                                color: Colors.white, // 设置字体颜色为白色
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            // return Searchres(
                            //   start: start,
                            //   end: end,
                            //   time: date,
                            // ); //返回的是需要跳转单页面
                            return HotelListPage();
                          },
                        ));
                      },
                      child: Card(
                        elevation: 10,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage('assets/images/hotel.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.srcOver,
                              ),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            '酒店预订',
                            style: TextStyle(
                              fontSize: 18, // 设置字体大小
                              fontWeight: FontWeight.bold, // 设置字体粗细
                              color: Colors.white, // 设置字体颜色为白色
                            ),
                          )),
                        ),
                      ),
                    )),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              // return Searchres(
                              //   start: start,
                              //   end: end,
                              //   time: date,
                              // ); //返回的是需要跳转单页面
                              return Weather();
                            },
                          ));
                        },
                        child: Card(
                          elevation: 10,
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage('assets/images/weather.jpg'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.srcOver,
                                ),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              '气象预报',
                              style: TextStyle(
                                fontSize: 18, // 设置字体大小
                                fontWeight: FontWeight.bold, // 设置字体粗细
                                color: Colors.white, // 设置字体颜色为白色
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // BeautifulCards(),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Chip(label: Text('标签1')),
                    Chip(label: Text('标签2')),
                    Chip(label: Text('标签3')),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}

class BeautifulCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Row(
          children: [
            Expanded(
              child: Card(
                child: Container(
                  height: 150,
                  child: Center(child: Text('卡片1')),
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Card(
                child: Container(
                  height: 150,
                  child: Center(child: Text('卡片2')),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          children: [
            Expanded(
              child: Card(
                child: Container(
                  height: 150,
                  child: Center(child: Text('卡片3')),
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Card(
                child: Container(
                  height: 150,
                  child: Center(child: Text('卡片4')),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
