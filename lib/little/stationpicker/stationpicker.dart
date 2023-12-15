import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/login/login1.dart';
import 'AlphabetButtonField.dart';
import 'ChildrenItemField.dart';
import 'CityItemField.dart';

var scrollController = new ScrollController();

class LocationEntity {
  List<String> cityList;
  String code;
  double top;
  double bottom;

  LocationEntity(
      {required this.cityList,
      required this.code,
      required this.top,
      required this.bottom});
}

class SelectCityField extends StatefulWidget {
  SelectCityField({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SelectCityFieldState();
}

class SelectCityFieldState extends State<SelectCityField> {
  var scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            alignment: Alignment.center,
            child: Text(
              "选择城市",
              style: TextStyle(color: Colors.black),
            ),
          ),
          leading: IconButton(
            color: Colors.grey,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  print('ss');
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Searchstation()),
                  ).then((txt) {
                    Navigator.pop(context, txt);
                  });
                },
                icon: Icon(Icons.search)),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/json/city.json'), //这里改成你自己资源文件位置
            builder: (context, snapshot) {
              if (ConnectionState.done == snapshot.connectionState) {
                List result = json.decode(snapshot.data.toString());
                List<LocationEntity> localCity = [];
                double height = 0;
                double bottom = 0;
                for (int i = 0; i < result.length; i++) {
                  List cityNameJson = result[i]["cityList"];
                  List<String> cityNames = [];
                  for (int j = 0; j < cityNameJson.length; j++) {
                    cityNames.add(cityNameJson[j]);
                  }

                  bottom += 50 + 50 * cityNames.length;
                  localCity.add(LocationEntity(
                      code: result[i]["code"],
                      cityList: cityNames,
                      top: height,
                      bottom: bottom));

                  height += 50 + 50 * cityNames.length;
                }
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                        child: ListView(
                      controller: scrollController,
                      shrinkWrap: true,
                      children: city(localCity),
                    )),
                    Positioned(
                      child: Column(
                        children: alphabetChildren(localCity),
                      ),
                      right: 5,
                      top: 100,
                    )
                  ],
                );
              }
              return Text("载入中...");
            },
          ),
        ));
  }

  List<Widget> city(List<LocationEntity> localCity) {
    List<Widget> _list = [];
    for (int i = 0; i < localCity.length; i++) {
      _list.add(CityItemField(
        title: Container(
          alignment: Alignment.centerLeft,
          height: 50,
          child: Text(
            localCity[i].code,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        children: createChildren(localCity[i].cityList),
      ));
    }

    return _list;
  }

  List<Widget> createChildren(List<String> list) {
    List<Widget> _list = [];
    for (int i = 0; i < list.length; i++) {
      _list.add(ChildrenItemField(
        text: list[i],
        onTap: (txt) {
          Navigator.pop(context, txt);
        },
      ));
    }
    return _list;
  }

  List<Widget> alphabetChildren(List<LocationEntity> localCity) {
    List<Widget> _list = [];
    for (int i = 0; i < localCity.length; i++) {
      _list.add(AlphabetButtonField(
        child: Container(
          child: Text(
            localCity[i].code,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        top: localCity[i].top,
        bottom: localCity[i].bottom,
        controller: scrollController,
        onTap: (Object value) {
          scrollController.animateTo(double.parse(value.toString()),
              duration: new Duration(milliseconds: 5), curve: Curves.ease);
        },
      ));
    }
    return _list;
  }
}
