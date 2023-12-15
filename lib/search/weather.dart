import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/weatherview.jpg',
            fit: BoxFit.cover,
          ),
          // 在这里添加其他内容，如文本、按钮等
        ],
      ),
    );
  }
}
