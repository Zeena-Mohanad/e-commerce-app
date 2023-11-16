import 'package:e_commerce_app/api/array_image_api.dart';
import 'package:e_commerce_app/models/product_array_image.dart';
import 'package:flutter/material.dart';

class ImageArrayProvider extends ChangeNotifier {
  final api = ArrayImageApi();
  bool isLoading = false;
  ProductArrayImage image =ProductArrayImage();
  ProductArrayImage get getImage => image;

  Future<void> getAllImages(String productId) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await api.getAllImages(productId);

      if (response.image!.isNotEmpty) {
        image = response;
      } else {
        print("No images found for $productId.");
      }

      isLoading = false;
    } catch (e) {
      print("Error fetching images: $e");
    } finally {
      notifyListeners();
    }
  }
}
