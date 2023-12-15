import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/search/Datepick.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'register.dart';
import '../widget/index.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String userName = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserModel>(context);
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey, //开启自动校验
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Title2(),
                  ),
                  SizedBox(
                    height: 200,
                    width: 398,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            autofocus: true,
                            maxLength: 20,
                            decoration: InputDecoration(
                                labelText: "用户名",
                                hintText: "用户名或邮箱",
                                icon: Icon(Icons.person)),
                            validator: (v) {
                              return v!.trim().length > 0 ? null : "用户名不能为空";
                            },
                            onSaved: (value) {
                              userName = value!;
                            },
                          ),
                          TextFormField(
                            maxLength: 20,
                            decoration: InputDecoration(
                                labelText: "密码",
                                hintText: "您的登录密码",
                                icon: Icon(Icons.lock)),
                            obscureText: true,
                            validator: (v) {
                              return v!.trim().length > 5 ? null : "密码不能少于6位";
                            },
                            onSaved: (value) {
                              password = value!;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    height: 45.0,
                    width: 350,
                    margin: EdgeInsets.only(top: 30.0),
                    child: new SizedBox.expand(
                      child: new RaisedButton(
                        onPressed: () async {
                          var formState = _formKey.currentState;
                          if (formState!.validate()) {
                            formState.save();
                            Response response =
                                await Http.login(userName, password);
                            if (int.parse(json.encode(response.data)) == 0) {
                              _user.setInfo(userName, password);
                              Navigator.pop(context, "success");
                            } else {
                              await showInfoDialog();
                            }
                          }
                        },
                        color: Colors.lightBlue,
                        child: new Text(
                          '登录',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(45.0)),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 28.0),
                  //   child: Row(
                  //     children: <Widget>[
                  //       Expanded(
                  //         child: RaisedButton(
                  //           padding: EdgeInsets.all(15.0),
                  //           child: Text("登录"),
                  //           color: Theme.of(context).primaryColor,
                  //           textColor: Colors.white,
                  //           onPressed: () async {
                  //             var formState = _formKey.currentState;
                  //             if (formState!.validate()) {
                  //               formState.save();
                  //               Response response =
                  //                   await Http.login(userName, password);
                  //               if (int.parse(json.encode(response.data)) ==
                  //                   0) {
                  //                 _user.setInfo(userName, password);
                  //                 Navigator.pop(context, "success");
                  //               } else {
                  //                 await showInfoDialog();
                  //               }
                  //             }
                  //           },
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
            new Container(
              margin: EdgeInsets.only(top: 30.0),
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Container(
                      child: TextButton(
                    child: Text(
                      '注册账号',
                      style: TextStyle(
                          fontSize: 13.0,
                          color: Color.fromARGB(255, 53, 53, 53)),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Register();
                      }));
                    },
                  )),
                  Text(
                    '忘记密码？',
                    style: TextStyle(
                        fontSize: 13.0, color: Color.fromARGB(255, 53, 53, 53)),
                  ),
                ],
              ),
            ),
            // ElevatedButton(
            //   child: Text("注册"),
            //   onPressed: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) {
            //       return Register();
            //     }));
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Future<bool?> showInfoDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("用户名或密码错误"),
          actions: <Widget>[
            TextButton(
              child: Text("好的"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            )
          ],
        );
      },
    );
  }
}
//   void login() async {
//     var formState = _formKey.currentState;
//     if (formState!.validate()) {
//       formState.save();
//       Response response = await Http.login(userName, password);
//       if (int.parse(json.encode(response.data)) == 0) {
//         _user.setInfo(userName, password);
//         Navigator.pop(context, "success");
//       } else {
//         await showInfoDialog();
//       }
//     }
//   }
// }
