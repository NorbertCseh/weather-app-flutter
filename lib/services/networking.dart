import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response weatherData = await http.get(Uri.parse(url));
    if (weatherData.statusCode == 200) {
      String data = weatherData.body;

      return jsonDecode(data);
    } else {
      print(weatherData.statusCode);
    }
  }
}
