// TODO Implement this library.
import 'package:flutter/material.dart';

class CityItemField extends StatefulWidget {
  final Widget title;
  final List<Widget> children;
  CityItemField({Key? key, required this.title, required this.children})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CityItemFieldState();
}

class CityItemFieldState extends State<CityItemField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: widget.title,
          ),
          Column(
            children: widget.children,
          )
        ],
      ),
    );
  }
}
