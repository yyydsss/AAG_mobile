import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageDisplay extends StatefulWidget {
  String imagepath;

  ImageDisplay({required this.imagepath});
  @override
  _ImageDisplayState createState() => _ImageDisplayState();
}

class _ImageDisplayState extends State<ImageDisplay> {
  Uint8List? imageBytes;

  Future<void> fetchImage() async {
    final imageUrl = 'http://10.147.20.90:8000/api/v1/downloader/image';
    Map<String, dynamic> ss = {"path": widget.imagepath};
    final response = await http.post(
      Uri.parse(imageUrl), // 替换为实际的POST请求URL
      // body: jsonEncode(componentNames),
      body: jsonEncode(ss),
      // headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      setState(() {
        imageBytes = response.bodyBytes;
      });
    } else {
      print('Error fetching image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: fetchImage,
            child: Text('Fetch Image'),
          ),
          SizedBox(height: 20),
          imageBytes != null
              ? Image.memory(
                  imageBytes!,
                  fit: BoxFit.cover,
                )
              : Container(),
        ],
      ),
    );
  }
}
