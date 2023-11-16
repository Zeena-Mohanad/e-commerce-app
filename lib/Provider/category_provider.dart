import 'package:e_commerce_app/api/category_api.dart';
import 'package:e_commerce_app/models/category.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final api = CategoryApi();
  bool isLoading = false;
  List<Category> categories = [];
  List<Category> get getCategories => categories;

  Future<void> getAllCategories() async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await api.getCategories();

      if (response.isNotEmpty) {
        categories = response;
      } else {
        print("No categories found.");
      }

      isLoading = false;
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      notifyListeners();
    }
  }
}