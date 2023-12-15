import 'package:flutter/material.dart';

class Seatbox extends StatelessWidget {
  Seatbox(
      {Key? key,
      required this.count,
      required this.title,
      required this.onPressed,
      required this.click})
      : super(key: key);
  final String count;
  final String title;
  final bool click;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child: new Column(
        children: [
          new Padding(
            padding: const EdgeInsets.only(
              bottom: 4.0,
            ),
            child: new Text(count,
                style: new TextStyle(
                    fontSize: 18.0,
                    color: click ? Colors.white : Colors.black)),
          ),
          new Text(title,
              style: new TextStyle(
                  color: click ? Colors.white : Colors.black54,
                  fontSize: 14.0)),
        ],
      ),
    );
  }
}
