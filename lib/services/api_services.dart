import 'dart:convert';

import 'package:e_commerce_cart/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  var cilent = http.Client();

  Future<List<Product>> getProducts() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> jsonString = jsonDecode(response.body)['products'];
      return jsonString.map((e) => Product.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
