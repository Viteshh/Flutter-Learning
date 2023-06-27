import 'dart:convert';

import 'package:first_app/api_constant.dart';
import 'package:first_app/product_listing/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Products>> getProduct(
      {String? categories, String? search}) async {
    var url = Uri.parse(
        ApiConstants.baseUrl + ApiConstants.productEndpoint + categories!);
    print("url $url");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print("api suceess");
      List<Products> model = productModelFromJson(response.body);

      return model;
    } else {
      throw Exception('Failed to load data');
    }
  }

  getCategory() async {
    var url = Uri.parse(ApiConstants.category);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      // List<Products> model = toList(response.body);
      // return model;
      List<dynamic> cateList = json.decode(response.body);
      return cateList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
