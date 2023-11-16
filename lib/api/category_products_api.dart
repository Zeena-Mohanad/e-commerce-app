import 'package:e_commerce_app/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:e_commerce_app/base_url.dart';

class CategoryProductsApi {
  Future<List<Product>> getCategoryProducts(String categoryId) async {
    String url = '$baseUrl/api/Employ/data/$categoryId';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    try {
      if (response.statusCode == 200) {
        final dynamic jsonData = jsonDecode(response.body);

        if (jsonData is Map && jsonData.containsKey('response')) {
          final List<dynamic> productList = jsonData['response'];

          final products = Product.listFromJson(productList);
          
          return products;
        } else {
          print("API request failed with status code: ${response.statusCode}");
        }
      }
    } catch (e) {
      print(e);
      print(response.statusCode);
      print(response.body);
    }
    return [];
  }
}
