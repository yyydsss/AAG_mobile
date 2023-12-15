import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  bool _isLogin = false;
  String _username = '';
  String _password = '';
  bool _flag = false;

  bool get isLogin => _isLogin;
  String get username => _username;
  String get password => _password;
  bool get flag => _flag;

  void setInfo(String username, String password) {
    _isLogin = true;
    _username = username;
    _password = password;
    notifyListeners();
  }

  void log() {
    _isLogin = !_isLogin;
    notifyListeners();
  }

  void f() {
    _flag = !_flag;
    notifyListeners();
  }
}
