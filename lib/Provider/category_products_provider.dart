import 'package:e_commerce_app/api/category_products_api.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';

class CategoryProductsProvider extends ChangeNotifier {
  final api = CategoryProductsApi();
  bool isLoading = false;
  List<Product> products = [];
  List<Product> get getProducts => products;

  Product product = Product();
  Product get getProduct => product;

  Future<void> getAllCategoryProducts(String categoryId) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await api.getCategoryProducts(categoryId);

      if (response.isNotEmpty) {
        products = response;
      } else {
        print("No products found for $categoryId.");
      }

      isLoading = false;
    } catch (e) {
      print("Error fetching products for $categoryId: $e");
    } finally {
      notifyListeners();
    }
  }
}
