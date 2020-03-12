import 'package:http/http.dart' as http;
import 'dart:convert';

String apiKey = '6971ba35d7581501cb601b5260fed763';

class Networking {
  Networking(this.url);

  final String url;

  String cityName;
  var temp;
  int condition;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
