import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/little/stationpicker/stationpicker.dart';
import 'package:lpinyin/lpinyin.dart';

String text = "北京南";

class Searchstation extends StatefulWidget {
  @override
  _Searchstation createState() => new _Searchstation();
}

class _Searchstation extends State<Searchstation> {
  //获取Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();

  void login() {
    //读取当前的Form状态
    var loginForm = loginKey.currentState;
    //验证Form表单
    if (loginForm!.validate()) {
      loginForm.save();
      print(PinyinHelper.getShortPinyin(text)[0].toUpperCase());
    }
  }

  @override
  void initState() {
    super.initState();

    this._name.text = ''; // 设置初始值
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Form表单示例',
      home: new Scaffold(
        body: new Column(
          children: <Widget>[
            new Text(_name.text),
            new Container(
              padding: const EdgeInsets.all(16.0),
              child: new Form(
                key: loginKey,
                autovalidate: true,
                child: new Column(
                  children: <Widget>[
                    new Container(
                      decoration: new BoxDecoration(
                          border: new Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 240, 240, 240),
                                  width: 1.0))),
                      child: new TextFormField(
                        decoration: new InputDecoration(
                          prefixIcon: new Icon(Icons.search),
                          labelText: '搜索站点',
                          labelStyle: new TextStyle(
                              fontSize: 15.0,
                              color: Color.fromARGB(255, 93, 93, 93)),
                          border: InputBorder.none,
                          suffixIcon: new IconButton(
                            icon: new Icon(
                              Icons.close,
                              color: Color.fromARGB(255, 126, 126, 126),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          this.setState(() {
                            this._name.text = value;
                          });
                        },
                        onSaved: (value) {
                          this.setState(() {
                            this._name.text = value!;
                          });
                        },
                        validator: (phone) {
                          // if(phone.length == 0){
                          //   return '请输入手机号';
                          // }
                        },
                        onFieldSubmitted: (value) {},
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      child: FutureBuilder(
                        future: DefaultAssetBundle.of(context).loadString(
                            'assets/json/city.json'), //这里改成你自己资源文件位置
                        builder: (context, snapshot) {
                          if (ConnectionState.done ==
                              snapshot.connectionState) {
                            List result = json.decode(snapshot.data.toString());
                            List<LocationEntity> localCity = [];
                            // double height = 0;
                            // double bottom = 0;
                            List<String> cityNames = [];
                            for (int i = 0; i < result.length; i++) {
                              List cityNameJson = result[i]["cityList"];

                              for (int j = 0; j < cityNameJson.length; j++) {
                                if (cityNameJson[j]
                                    .toString()
                                    .contains(_name.text))
                                  cityNames.add(cityNameJson[j]);
                              }
                            }
                            return SizedBox(
                              height: 400,
                              width: 500,
                              child: ListView(
                                controller: scrollController,
                                shrinkWrap: true,
                                children: selectcity(cityNames),
                              ),
                            );
                          }
                          return Text("载入中...");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> selectcity(List<String> cityNames) {
    List<Widget> _list = [];

    for (int i = 0; i < cityNames.length; i++) {
      _list.add(GestureDetector(
        child: Container(
          alignment: Alignment.centerLeft,
          height: 50,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            cityNames[i],
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 20,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context, cityNames[i]);
        },
      ));
    }

    return _list;
  }
}































// import 'package:flutter/material.dart';
// import 'package:lpinyin/lpinyin.dart';

// String text = "北京南";

// class Login extends StatefulWidget {
//   @override
//   _Login createState() => new _Login();
// }

// class _Login extends State<Login> {
//   //获取Key用来获取Form表单组件
//   GlobalKey<FormState> loginKey = new GlobalKey<FormState>();
//   late String userName;
//   late String password;
//   TextEditingController _name = TextEditingController();
//   bool isShowPassWord = false;

//   void login() {
//     //读取当前的Form状态
//     var loginForm = loginKey.currentState;
//     //验证Form表单
//     if (loginForm!.validate()) {
//       loginForm.save();
//       print('userName: ' + userName + ' password: ' + password);
//       print(PinyinHelper.getShortPinyin(text)[0].toUpperCase());
//     }
//   }

//   @override
//   void initState() {
//     super.initState();

//     this._name.text = 'ptbird'; // 设置初始值
//   }

//   void showPassWord() {
//     setState(() {
//       isShowPassWord = !isShowPassWord;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Form表单示例',
//       home: new Scaffold(
//         body: new Column(
//           children: <Widget>[
//             new Text(_name.text),
//             new Container(
//                 padding: EdgeInsets.only(top: 100.0, bottom: 10.0),
//                 child: new Text(
//                   'TICKET',
//                   style: TextStyle(color: Colors.lightBlue, fontSize: 50.0),
//                 )),
//             new Container(
//               padding: const EdgeInsets.all(16.0),
//               child: new Form(
//                 key: loginKey,
//                 autovalidate: true,
//                 child: new Column(
//                   children: <Widget>[
//                     new Container(
//                       decoration: new BoxDecoration(
//                           border: new Border(
//                               bottom: BorderSide(
//                                   color: Color.fromARGB(255, 240, 240, 240),
//                                   width: 1.0))),
//                       child: new TextFormField(
//                         decoration: new InputDecoration(
//                           labelText: '请输入手机号',
//                           labelStyle: new TextStyle(
//                               fontSize: 15.0,
//                               color: Color.fromARGB(255, 93, 93, 93)),
//                           border: InputBorder.none,
//                           // suffixIcon: new IconButton(
//                           //   icon: new Icon(
//                           //     Icons.close,
//                           //     color: Color.fromARGB(255, 126, 126, 126),
//                           //   ),
//                           //   onPressed: () {

//                           //   },
//                           // ),
//                         ),
//                         keyboardType: TextInputType.phone,
//                         onChanged: (value) {
//                           this.setState(() {
//                             this._name.text = value;
//                           });
//                         },
//                         onSaved: (value) {
//                           userName = value!;
//                           this.setState(() {
//                             this._name.text = value;
//                           });
//                         },
//                         validator: (phone) {
//                           // if(phone.length == 0){
//                           //   return '请输入手机号';
//                           // }
//                         },
//                         onFieldSubmitted: (value) {},
//                       ),
//                     ),
//                     new Container(
//                       decoration: new BoxDecoration(
//                           border: new Border(
//                               bottom: BorderSide(
//                                   color: Color.fromARGB(255, 240, 240, 240),
//                                   width: 1.0))),
//                       child: new TextFormField(
//                         decoration: new InputDecoration(
//                             labelText: '请输入密码',
//                             labelStyle: new TextStyle(
//                                 fontSize: 15.0,
//                                 color: Color.fromARGB(255, 93, 93, 93)),
//                             border: InputBorder.none,
//                             suffixIcon: new IconButton(
//                               icon: new Icon(
//                                 isShowPassWord
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                                 color: Color.fromARGB(255, 126, 126, 126),
//                               ),
//                               onPressed: showPassWord,
//                             )),
//                         obscureText: !isShowPassWord,
//                         onSaved: (value) {
//                           password = value!;
//                         },
//                       ),
//                     ),
//                     new Container(
//                       height: 45.0,
//                       width: 200,
//                       margin: EdgeInsets.only(top: 40.0),
//                       child: new SizedBox.expand(
//                         child: new RaisedButton(
//                           onPressed: login,
//                           color: Colors.lightBlue,
//                           child: new Text(
//                             '登录',
//                             style: TextStyle(
//                                 fontSize: 14.0,
//                                 color: Color.fromARGB(255, 255, 255, 255)),
//                           ),
//                           shape: new RoundedRectangleBorder(
//                               borderRadius: new BorderRadius.circular(45.0)),
//                         ),
//                       ),
//                     ),
//                     new Container(
//                       margin: EdgeInsets.only(top: 30.0),
//                       padding: EdgeInsets.only(left: 8.0, right: 8.0),
//                       child: new Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           new Container(
//                               child: TextButton(
//                             child: Text(
//                               '注册账号',
//                               style: TextStyle(
//                                   fontSize: 13.0,
//                                   color: Color.fromARGB(255, 53, 53, 53)),
//                             ),
//                             onPressed: () {},
//                           )),
//                           Text(
//                             '忘记密码？',
//                             style: TextStyle(
//                                 fontSize: 13.0,
//                                 color: Color.fromARGB(255, 53, 53, 53)),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
