import 'package:flutter/material.dart';

import 'stationpicker.dart';

class LocationField extends StatefulWidget {
  LocationField({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LocationFieldState();
}

class LocationFieldState extends State<LocationField> {
  String locationValue = "定位中...";

  void locationText() async {}

  void setLocation(String city) {
    setState(() {
      locationValue = city;
    });
  }

  @override
  void initState() {
    super.initState();
    locationText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: IconButton(
                iconSize: 24.0,
                color: Colors.grey,
                icon: Icon(Icons.expand_more),
                onPressed: () {
                  print('ss');
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new SelectCityField()),
                  ).then((txt) {
                    setLocation(txt);
                  });
                }),
          ),
          Text(
            locationValue,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
