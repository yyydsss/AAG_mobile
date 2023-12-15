import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rectangle Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Aitest(),
      routes: {
        '/options': (context) => OptionsPage(),
      },
    );
  }
}

class Aitest extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Aitest> {
  int rectangleCount = 3;
  List<String> selectedOptions = List<String>.filled(3, '');

  void increaseRectangleCount() {
    setState(() {
      rectangleCount++;
      selectedOptions.add('');
    });
  }

  void decreaseRectangleCount() {
    setState(() {
      if (rectangleCount > 0) {
        rectangleCount--;
        selectedOptions.removeLast();
      }
    });
  }

  void selectOption(int index) async {
    final selectedOption = await Navigator.pushNamed(context, '/options');
    if (selectedOption != null) {
      setState(() {
        selectedOptions[index] = selectedOption.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rectangle Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: rectangleCount,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => selectOption(index),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        selectedOptions[index].isNotEmpty
                            ? selectedOptions[index]
                            : 'Select an option',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: increaseRectangleCount,
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: decreaseRectangleCount,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class OptionsPage extends StatelessWidget {
  List<String> options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options'),
      ),
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context, options[index]);
            },
            child: Card(
              child: ListTile(
                title: Text(options[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
