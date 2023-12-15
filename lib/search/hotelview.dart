import 'package:flutter/material.dart';
import 'package:flutter_application_1/search/chat.dart';

class Hotel {
  String name;
  List<String> images;
  String location;
  String mapLocation;
  List<RoomType> roomTypes;

  Hotel({
    required this.name,
    required this.images,
    required this.location,
    required this.mapLocation,
    required this.roomTypes,
  });
}

class RoomType {
  String name;
  double price;
  String thumbnail;

  RoomType({
    required this.name,
    required this.price,
    required this.thumbnail,
  });
}

Hotel myhotel = Hotel(
  name: 'ABC 酒店',
  images: [
    'assets/images/hotel_a.jpg',
    'assets/images/hotel_b.jpg',
    'assets/images/hotel_a.jpg',
  ],
  location: '北京市东城区景山前街4号',
  mapLocation: 'https://maps.google.com/maps?q=latitude,longitude',
  roomTypes: [
    RoomType(
      name: '豪华房',
      price: 200,
      thumbnail: 'assets/images/hotel.jpg',
    ),
    RoomType(
      name: '家庭房',
      price: 200,
      thumbnail: 'assets/images/hotel.jpg',
    ),
    RoomType(
      name: '标准房',
      price: 150,
      thumbnail: 'assets/images/hotel.jpg',
    ),
    RoomType(
      name: '双人间',
      price: 200,
      thumbnail: 'assets/images/hotel.jpg',
    ),
    RoomType(
      name: '大床房',
      price: 200,
      thumbnail: 'assets/images/hotel.jpg',
    ),
    RoomType(
      name: '套房',
      price: 300,
      thumbnail: 'assets/images/hotel.jpg',
    ),
  ],
);

class HotelDetailPage extends StatelessWidget {
  final Hotel hotel = myhotel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('酒店详情'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            child: PageView.builder(
              itemCount: hotel.images.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  hotel.images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(hotel.images.length, (index) {
              return Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0 ? Colors.blue : Colors.grey,
                ),
              );
            }),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 10),
                      Text(
                        hotel.location,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.map),
                onPressed: () {
                  // 打开地图按钮点击事件
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: hotel.roomTypes.length,
              itemBuilder: (context, index) {
                RoomType roomType = hotel.roomTypes[index];
                return ListTile(
                  leading: Image.asset(
                    roomType.thumbnail,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  title: Text(roomType.name),
                  subtitle: Text('价格：${roomType.price}'),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // 联系商家按钮点击事件
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ),
                  );
                },
                child: Text('联系商家'),
              ),
              ElevatedButton(
                onPressed: () {
                  // 预定酒店按钮点击事件
                },
                child: Text('预定酒店'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
