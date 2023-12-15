import 'package:flutter/material.dart';
import 'package:flutter_application_1/search/noteview.dart';

import 'notelist.dart';

class Guide {
  String coverImage;
  String title;
  int views;

  Guide({required this.coverImage, required this.title, required this.views});
}

Note mynote = Note(
  title: '笔记2',
  coverImage: 'assets/note2.jpg',
  readCount: 100,
);

class SeesEE extends StatelessWidget {
  final List<Guide> guides = [
    Guide(
      coverImage: 'assets/images/note1.jpg',
      title: '旅行攻略1',
      views: 1000,
    ),
    Guide(
      coverImage: 'assets/images/note2.jpg',
      title: '旅行攻略2',
      views: 2000,
    ),
    Guide(
      coverImage: 'assets/images/note1.jpg',
      title: '旅行攻略1',
      views: 1000,
    ),
    Guide(
      coverImage: 'assets/images/note2.jpg',
      title: '旅行攻略2',
      views: 2000,
    ),
    Guide(
      coverImage: 'assets/images/note1.jpg',
      title: '旅行攻略1',
      views: 1000,
    ),
    Guide(
      coverImage: 'assets/images/note2.jpg',
      title: '旅行攻略2',
      views: 2000,
    ),
    Guide(
      coverImage: 'assets/images/note1.jpg',
      title: '旅行攻略1',
      views: 1000,
    ),
    Guide(
      coverImage: 'assets/images/note2.jpg',
      title: '旅行攻略2',
      views: 2000,
    ),
    Guide(
      coverImage: 'assets/images/note1.jpg',
      title: '旅行攻略1',
      views: 1000,
    ),
    Guide(
      coverImage: 'assets/images/note2.jpg',
      title: '旅行攻略2',
      views: 2000,
    ),
    Guide(
      coverImage: 'assets/images/note1.jpg',
      title: '旅行攻略1',
      views: 1000,
    ),
    Guide(
      coverImage: 'assets/images/note2.jpg',
      title: '旅行攻略2',
      views: 2000,
    ),
    // 添加更多攻略...
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: '搜索',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: guides.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                Guide guide = guides[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoteDetailPage(
                          note: mynote,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          guide.coverImage,
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            guide.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${guide.views} 浏览量',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
