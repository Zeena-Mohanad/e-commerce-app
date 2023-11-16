import 'package:e_commerce_app/models/product_array_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:e_commerce_app/base_url.dart';

class ArrayImageApi {

  Future<ProductArrayImage> getAllImages(String productId) async {
    String url = '$baseUrl/api/Employ/Product/arrayImage/$productId';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    ProductArrayImage image = ProductArrayImage();

    try {
      if (response.statusCode == 200) {
        final dynamic jsonData = jsonDecode(response.body);

        if (jsonData is Map && jsonData.containsKey('response')) {
          final Map<String,dynamic> responseMap = jsonData['response'];

            if (responseMap.containsKey('image') &&
                responseMap.containsValue(productId)) {
              //final List<dynamic> imageList = responseMap['image'];
              final image = ProductArrayImage.fromJson(responseMap);
              return image;
            }
        } else {
          print("API request failed with status code: ${response.statusCode}");
        }
      }
    } catch (e) {
      print(e);
      print(response.statusCode);
      print(response.body);
    }
    return image;
  }
}
