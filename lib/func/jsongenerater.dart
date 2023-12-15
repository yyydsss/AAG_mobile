import 'dart:convert';

String generateJsonSchema(String inputText, List<String> modelNames) {
  // 创建JSON对象的Map结构
  Map<String, dynamic> jsonSchema = {
    "id": 1,
    "time": "2023-12-13:12:12:12",
    "version": "0.0.1",
    "author": "zhang-san",
    "metadata": {"name": "新闻简报生成", "description": "输入新闻，生成新闻简报，包括新闻概括、图片。"},
    "nodes": {},
    "graph": {}
  };

  // 创建输入节点
  Map<String, dynamic> inputNode = {
    "content": [
      {"type": "text", "value": inputText}
    ],
    "geometry": {}
  };
  jsonSchema["nodes"]["input"] = inputNode;

  // 创建模型节点
  for (int i = 0; i < modelNames.length; i++) {
    String modelName = modelNames[i];
    String s = '';
    if (modelName == 'bart_large_cnn') {
      s = "text_to_text";
    }
    if (modelName == 'stable_diffusion_xl_base_1') {
      s = 'text_to_image';
    }
    if (modelName == 'fastspeech2_en') {
      s = 'text_to_audio';
    }
    Map<String, dynamic> modelNode = {
      "type": s,
      "model": modelName,
      "input": [
        {"type": "text", "value": ""}
      ],
      "output": [
        {"type": "text", "value": ""}
      ],
      "geometry": {}
    };
    jsonSchema["nodes"][modelName] = modelNode;

    // 创建节点之间的流向
    if (i == 0) {
      jsonSchema["graph"]["input"] = [modelName];
    } else {
      String prevModelName = modelNames[i - 1];
      jsonSchema["graph"][prevModelName] = [modelName];
    }

    if (i == modelNames.length - 1) {
      jsonSchema["graph"][modelName] = ["output"];
    }
  }

  // 创建输出节点
  Map<String, dynamic> outputNode = {
    "content": [
      {"type": "text", "value": ""},
    ]
  };
  jsonSchema["nodes"]["output"] = outputNode;

  // 将JSON对象转为字符串
  String jsonString = jsonEncode(jsonSchema);
  return jsonString;
}
