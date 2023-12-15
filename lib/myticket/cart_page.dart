import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/user_model.dart';
import 'package:provider/provider.dart';
import 'ticketcard.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPage createState() => _CartPage();
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserModel>(context);
    return Scaffold(
        appBar: AppBar(
            title: Text('我的车票信息'),
            backgroundColor: Colors.yellow[200],
            actions: <Widget>[]),
        body: new mycard(title: _user.flag.toString()));
  }
}

class _CartPage extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserModel>(context);
    setState(() {});
    return Scaffold(
        appBar: AppBar(
            title: Text('我的车票信息'),
            backgroundColor: Colors.yellow[200],
            actions: <Widget>[]),
        body: new mycard(title: _user.flag.toString()));
  }
}
