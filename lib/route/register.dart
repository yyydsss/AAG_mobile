import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/http.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _psd1Controller = TextEditingController();
  TextEditingController _psd2Controller = TextEditingController();
  String userName = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册"),
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
                  TextFormField(
                    autofocus: true,
                    controller: _nameController,
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
                    decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "您的登录密码",
                        icon: Icon(Icons.lock)),
                    controller: _psd1Controller,
                    obscureText: true,
                    validator: (v) {
                      return v!.trim().length > 5 ? null : "密码不能少于6位";
                    },
                    onSaved: (value) {
                      password = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "确定密码",
                        hintText: "重复您的登录密码",
                        icon: Icon(Icons.lock)),
                    controller: _psd2Controller,
                    obscureText: true,
                    validator: (v) {
                      return v!.trim() == _psd1Controller.text.trim()
                          ? null
                          : "密码不同";
                    },
                    onSaved: (value) {
                      password = value!;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            padding: EdgeInsets.all(15.0),
                            child: Text("注册"),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () async {
                              var formState = _formKey.currentState;
                              if (formState!.validate()) {
                                formState.save();
                                Response response =
                                    await Http.register(userName, password);
                                if (int.parse(json.encode(response.data)) ==
                                    0) {
                                  Navigator.pop(context, "success");
                                } else {
                                  await showInfoDialog();
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
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
          content: Text("用户已存在"),
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
