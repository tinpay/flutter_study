import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future<Map<String, dynamic>> getData() async {
    Response response = await get(this.url);

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
//      String weather = jsonDecode(data)["weather"][0]["description"];
//      double temperature = jsonDecode(data)["main"]["temp"];
//      int condition = jsonDecode(data)["weather"][0]["id"];
//      String cityName = jsonDecode(data)["name"];
    }
    print(response.statusCode);

    return null;
  }
}
