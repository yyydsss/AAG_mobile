import 'package:flutter/material.dart';

import 'hotelview.dart';

class Hotel {
  final String name;
  final String thumbnail;
  final int stars;
  final double price;

  Hotel({
    required this.name,
    required this.thumbnail,
    required this.stars,
    required this.price,
  });
}

class HotelListPage extends StatelessWidget {
  final List<Hotel> hotels = [
    Hotel(
      name: 'Hotel A',
      thumbnail: 'assets/hotel_a.jpg',
      stars: 4,
      price: 100.0,
    ),
    Hotel(
      name: 'Hotel B',
      thumbnail: 'assets/hotel_b.jpg',
      stars: 5,
      price: 150.0,
    ),
    Hotel(
      name: 'Hotel B',
      thumbnail: 'assets/hotel_b.jpg',
      stars: 5,
      price: 150.0,
    ),
    Hotel(
      name: 'Hotel B',
      thumbnail: 'assets/hotel_b.jpg',
      stars: 5,
      price: 150.0,
    ),
    Hotel(
      name: 'Hotel B',
      thumbnail: 'assets/hotel_b.jpg',
      stars: 5,
      price: 150.0,
    ),
    Hotel(
      name: 'Hotel B',
      thumbnail: 'assets/hotel_b.jpg',
      stars: 5,
      price: 150.0,
    ),
    Hotel(
      name: 'Hotel B',
      thumbnail: 'assets/hotel_b.jpg',
      stars: 5,
      price: 150.0,
    ),
    Hotel(
      name: 'Hotel B',
      thumbnail: 'assets/hotel_b.jpg',
      stars: 5,
      price: 150.0,
    ),
    Hotel(
      name: 'Hotel B',
      thumbnail: 'assets/hotel_b.jpg',
      stars: 5,
      price: 150.0,
    ),
    Hotel(
      name: 'Hotel B',
      thumbnail: 'assets/hotel_b.jpg',
      stars: 5,
      price: 150.0,
    ),

    // Add more hotels here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('酒店列表'),
      ),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HotelDetailPage(),
                ),
              );
            },
            child: Card(
              child: Row(
                children: [
                  Image.asset(
                    hotel.thumbnail,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hotel.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            SizedBox(width: 5),
                            Text('${hotel.stars} 星级'),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text('人均价格: \$${hotel.price.toStringAsFixed(2)}'),
                      ],
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
