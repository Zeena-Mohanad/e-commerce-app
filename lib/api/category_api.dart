import 'package:e_commerce_app/models/category.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:e_commerce_app/base_url.dart';

class CategoryApi {
  Future<List<Category>> getCategories() async {
    String url = '$baseUrl/api/Department/show';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    try {
      if (response.statusCode == 200) {
        final dynamic jsonData = jsonDecode(response.body);

        if (jsonData is Map && jsonData.containsKey('response')) {
          final List<dynamic> categoryList = jsonData['response'];

          final categories = Category.listFromJson(categoryList);

          return categories;
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
