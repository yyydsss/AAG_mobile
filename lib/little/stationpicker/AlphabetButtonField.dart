// TODO Implement this library.
import 'package:flutter/material.dart';

typedef AlphabetButtonTap = Function(Object value);

class AlphabetButtonField extends StatefulWidget {
  final Widget child;
  final double top;
  final double bottom;
  final AlphabetButtonTap onTap;
  final ScrollController controller;
  AlphabetButtonField(
      {Key? key,
      required this.child,
      required this.top,
      required this.bottom,
      required this.controller,
      required this.onTap})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => AlphabetButtonFieldState();
}

class AlphabetButtonFieldState extends State<AlphabetButtonField> {
  var buttonColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.position.pixels >= widget.top &&
          widget.controller.position.pixels < widget.bottom) {
        setButtonColor(Colors.grey);
      } else {
        setButtonColor(Colors.transparent);
      }
    });
  }

  void setButtonColor(Color color) {
    if (buttonColor != color) {
      setState(() {
        buttonColor = color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: buttonColor,
        child: widget.child,
      ),
      onTap: () {
        widget.onTap(widget.top);
      },
    );
  }
}
