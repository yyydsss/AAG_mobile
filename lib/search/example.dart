import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('页面示例'),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/1.jpg', // 替换为你的图片路径
                  fit: BoxFit.cover,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // 按钮1的点击事件处理逻辑
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16), // 按钮的内边距
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '第一行文本',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '第二行文本',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              '第三行文本',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // 按钮1的点击事件处理逻辑
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16), // 按钮的内边距
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '第一行文本',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '第二行文本',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              '第三行文本',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // 按钮1的点击事件处理逻辑
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16), // 按钮的内边距
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '第一行文本',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '第二行文本',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              '第三行文本',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Chip(label: Text('标签1')),
                    Chip(label: Text('标签2')),
                    Chip(label: Text('标签3')),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
