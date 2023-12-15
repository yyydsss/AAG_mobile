import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class spaceline extends StatelessWidget {
  late double spacing;
  spaceline({
    Key? key,
    required this.spacing,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: this.spacing,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.airport_shuttle,
            color: Colors.white54,
          ),
          Icon(
            Icons.airport_shuttle,
            color: Colors.white54,
          ),
          Icon(
            Icons.airport_shuttle,
            color: Colors.white54,
          ),
          Icon(
            Icons.airport_shuttle,
            color: Colors.white54,
          ),
          Icon(
            Icons.airport_shuttle,
            color: Colors.white54,
          ),
          Icon(
            Icons.airport_shuttle,
            color: Colors.white54,
          ),
          Icon(
            Icons.airport_shuttle,
            color: Colors.white54,
          ),
          Icon(
            Icons.airport_shuttle,
            color: Colors.white54,
          ),
        ],
      ),
    );
  }
}
