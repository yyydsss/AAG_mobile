// TODO Implement this library.
import 'package:flutter/material.dart';

typedef ChildrenButtonTap = Function(String value);

class ChildrenItemField extends StatefulWidget {
  final String text;
  final ChildrenButtonTap onTap;
  ChildrenItemField({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ChildrenItemFieldState();
}

class ChildrenItemFieldState extends State<ChildrenItemField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.centerLeft,
        height: 50,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 20,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      onTap: () {
        widget.onTap(widget.text);
      },
    );
  }
}
