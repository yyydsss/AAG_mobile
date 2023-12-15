import 'package:flutter/material.dart';

import 'notelist.dart';

class NoteDetailPage extends StatelessWidget {
  final Note note;

  NoteDetailPage({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('笔记详情'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            child: PageView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Image.asset(
                  note.coverImage,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Text(
                  '  当你来到北京，你会被丰富的历史文化和现代化的城市风貌所深深吸引。北京是中国的首都，拥有众多的世界知名景点，如故宫、天安门广场和长城等。在故宫，你可以领略到中华帝王的典雅府邸和精美文物；在天安门广场，你可以感受到庄严肃穆的国家象征；而长城则是中华民族的骄傲，它蜿蜒曲折地延伸在山脉之间，给人一种壮观的感觉。',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // 处理收藏按钮点击事件
              },
              child: Text('收藏'),
            ),
          ),
        ],
      ),
    );
  }
}
