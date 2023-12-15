import 'package:flutter/material.dart';
import 'package:flutter_application_1/login/login1.dart';
import 'package:flutter_application_1/search/presearch.dart';
import 'package:flutter_application_1/search/seesee.dart';
import 'package:flutter_application_1/userdispaly/userdispaly.dart';
import 'package:flutter_application_1/widget/http.dart';

import '../myticket/cart_page.dart';

/*导航页*/
class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }
}

class _IndexState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.green,
      icon: Icon(Icons.train),
      title: Text("立即出发"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.amber,
      icon: Icon(Icons.subject),
      title: Text("发现旅程"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.person),
      title: Text("个人中心"),
    ),
  ];

  late int currentIndex;

  final pages = [
    // SearchBarDemo(),
    PreSearch(),
    SeesEE(),
    MyHomePage(
      key: null,
    )
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.shifting, //修改该属性可设置导航栏类型：shifting或fixed
        onTap: (index) {
          _changePage(index);
          print(index);
        },
      ),
      // body: pages[currentIndex],
      body: Builder(
        builder: (BuildContext context) {
          print("aaa");
          Http.init();
          // return pages[currentIndex];
          return pages[currentIndex];
        },
      ),
    );
  }

  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
