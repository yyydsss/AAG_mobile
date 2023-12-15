import 'package:flutter/material.dart';

import 'noteview.dart';

class Note {
  final String title;
  final String coverImage;
  final int readCount; // 新增阅读量属性

  Note({
    required this.title,
    required this.coverImage,
    required this.readCount,
  });
}

class RedBookPage extends StatelessWidget {
  final List<Note> notes = [
    Note(
      title: '笔记1',
      coverImage: 'assets/note1.jpg',
      readCount: 100,
    ),
    Note(
      title: '笔记2',
      coverImage: 'assets/note2.jpg',
      readCount: 100,
    ),
    Note(
      title: '笔记2',
      coverImage: 'assets/note2.jpg',
      readCount: 100,
    ),
    Note(
      title: '笔记2',
      coverImage: 'assets/note2.jpg',
      readCount: 100,
    ),
    Note(
      title: '笔记2',
      coverImage: 'assets/note2.jpg',
      readCount: 100,
    ),
    Note(
      title: '笔记2',
      coverImage: 'assets/note2.jpg',
      readCount: 100,
    ),
    Note(
      title: '笔记2',
      coverImage: 'assets/note2.jpg',
      readCount: 100,
    ),
    Note(
      title: '笔记2',
      coverImage: 'assets/note2.jpg',
      readCount: 100,
    ),
    Note(
      title: '笔记2',
      coverImage: 'assets/note2.jpg',
      readCount: 100,
    ),
    Note(
      title: '笔记2',
      coverImage: 'assets/note2.jpg',
      readCount: 100,
    ),
    // 添加更多笔记
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('旅行攻略'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return InkWell(
            onTap: () {
              // 处理卡片点击事件，跳转到详情页
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteDetailPage(note: note),
                ),
              );
            },
            child: Card(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        note.coverImage,
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          note.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      color: Colors.grey[300],
                      padding: EdgeInsets.all(4),
                      child: Text(
                        '阅读量: ${note.readCount}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
