import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import '../widget/index.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserModel>(context);
    return Material(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              constraints: BoxConstraints(minWidth: double.infinity),
              child: GestureDetector(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.face,color: Colors.green,size: 100),
                      Builder(builder: (BuildContext context) {
                        if(_user.isLogin){
                          return Text('hi ${_user.username}',textScaleFactor: 2);
                        }
                        else{
                          return Text('未登录',textScaleFactor: 2);
                        }
                      }),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push( context,
                      MaterialPageRoute(builder: (context) {
                        return Login();
                      }));
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green,
              child:Center(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.face,color: Colors.blue,size: 100),
                    Builder(builder: (BuildContext context) {
                      if(_user.isLogin){
                        return Text('hi ${_user.username}',textScaleFactor: 2);
                      }
                      else{
                        return Text('未登录',textScaleFactor: 2);
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
