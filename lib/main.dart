// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/launch.dart';
// import 'package:flutter_application_1/widget/user_model.dart';
// import 'package:provider/provider.dart';
// import 'Aiagent/aitest.dart';
// import 'Navigator/index_page.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider.value(
//         value: UserModel(), // 需要共享的数据资源
//         child: MaterialApp(
//             title: 'Flutter FT',
//             routes: {
//               '/options': (context) => OptionsPage(),
//             },
//             theme: ThemeData(
//               primaryColor: Colors.blue.shade300,
//             ),
//             home:
//                 // TickView(
//                 //     startsation: '北京',
//                 //     endstation: '上海',
//                 //     endtime: '12:00',
//                 //     starttime: '11:30',
//                 //     trainid: 'D14',
//                 //     price: 20)
//                 // AlertDialogDemo()
//                 Aitest()));
//   }
// }
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Aiagent/getimage.dart';
import 'package:flutter_application_1/func/jsongenerater.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String post_url = 'http://10.147.20.90:8000/api/v1/project/run_by_schema';
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
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/options': (context) => OptionsPage(),
      },
    );
  }
}

class ModelChoice {
  String tag;
  String selectedOption;

  ModelChoice({required this.tag, this.selectedOption = ''});
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int rectangleCount = 3;
  List<ModelChoice> selectedOptions = [
    ModelChoice(tag: 'rectangle_tag_0'),
    ModelChoice(tag: 'rectangle_tag_1'),
    ModelChoice(tag: 'rectangle_tag_2'),
  ];
  TextEditingController textEditingController = TextEditingController();

  void increaseRectangleCount() {
    setState(() {
      rectangleCount++;
      selectedOptions
          .add(ModelChoice(tag: 'rectangle_tag_${rectangleCount - 1}'));
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
        selectedOptions[index].selectedOption = selectedOption.toString();
      });
    }
  }

  void updateText(int index) {
    setState(() {
      selectedOptions[index].selectedOption = textEditingController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AAG'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: textEditingController,
                // onChanged: (value) => updateText(0),
                decoration: InputDecoration(
                  hintText: 'Enter text',
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: rectangleCount,
              itemBuilder: (BuildContext context, int index) {
                final modelChoice = selectedOptions[index];

                return GestureDetector(
                  onTap: () => selectOption(index),
                  child: Hero(
                    tag: modelChoice.tag,
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
                          modelChoice.selectedOption.isNotEmpty
                              ? modelChoice.selectedOption
                              : 'Select an option',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
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
          ElevatedButton(
            onPressed: () async {
              List<String> componentNames = selectedOptions
                  .map((choice) => choice.selectedOption)
                  .toList();
              String res = generateJsonSchema(
                  textEditingController.text, componentNames);
              print(res);
              Map<String, dynamic> jsonhuchao = {
                "username": "huchao",
                "schema": res,
              };
              String stringhuchao = jsonEncode(jsonhuchao);
              final response =
                  await http.post(Uri.parse(post_url), // 替换为实际的POST请求URL
                      // body: jsonEncode(componentNames),
                      body: stringhuchao
                      // headers: {'Content-Type': 'application/json'},
                      );

              if (response.statusCode == 200) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(response: response.body),
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Error'),
                      content: Text('Failed to make POST request.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: Text('运行'),
          ),
          // List<String> componentNames = selectedOptions
          //     .map((choice) => choice.selectedOption)
          //     .toList();
        ],
      ),
    );
  }
}

class OptionsPage extends StatelessWidget {
  List<String> options = [
    'bart_large_cnn',
    'stable_diffusion_xl_base_1',
    'fastspeech2_en',
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
              final selectedOption = options[index];
              Navigator.pop(context, selectedOption);
            },
            child: ListTile(
              title: Hero(
                tag:
                    'rectangle_tag_${ModalRoute.of(context)!.settings.arguments}',
                child: Text(options[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final String response;
  late String txt;
  late String type;

  ResultPage({
    required this.response,
  }) {
    var responseBody = jsonDecode(response);
    // // print(responseBody);
    var output = responseBody['result'];

    var res = jsonDecode(output);
    txt = res['output']['content'][0]['value'];
    type = res['output']['content'][0]['type'];
    log(res['output']['content'][0].toString());
    // var content = res['content'];
    // var first = content[0];
    // txt = first['value'];
    // type = first['type'];

    // String txt = trueoutput[0]['value'];
    // var lastItem = output[1];
    // var txt = lastItem['value'];
    // txt = output['value'];
    // log(responseBody.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: type == 'image'
          ? ImageDisplay(imagepath: txt)
          : Center(
              child: Text(txt),
            ),
    );
  }
}
