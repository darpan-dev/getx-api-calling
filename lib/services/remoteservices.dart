import 'dart:convert';

import 'package:getx_api_calling/model/product.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<Welcome?> fetchProducts() async {
    Uri url = Uri.parse('https://api.jikan.moe/v3/search/anime?q=naruto');
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return Welcome.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
