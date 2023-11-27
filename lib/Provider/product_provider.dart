import 'package:e_commerce_app/api/product_api.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final api = ProductApi();
  bool isLoading = false;
  String searchText = '';
  List<Product> products = [];
  List<Product> get getProducts => products;
  List<Product> searchProducts = [];
  List<Product> get getSearch => searchProducts;

  Future<void> getAllProducts() async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await api.getAllProducts();

      if (response.isNotEmpty) {
        products = response;
      } else {
        print("No products found.");
      }

      isLoading = false;
    } catch (e) {
      print("Error fetching products: $e");
    }
    notifyListeners();
  }

  getSearchProducts() {
    searchProducts.clear();
    if (searchText.isNotEmpty) {
      searchProducts.addAll(products
          .where((element) =>
              element.name!.toLowerCase().startsWith(searchText.toLowerCase()))
          .toList());
    } else {
      searchProducts.addAll(products);
    }
    notifyListeners();
  }

  search(String search) {
    searchText = search;
    getSearchProducts();
    notifyListeners();
  }
}
