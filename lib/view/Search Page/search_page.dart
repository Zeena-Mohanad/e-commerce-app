import 'package:e_commerce_app/Provider/product_provider.dart';
import 'package:e_commerce_app/view/Search%20Page/search_product_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key, required this.categoryId, required this.categoryName});

  final String categoryId;
  final String categoryName;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
              onPressed: () {}, icon: const Icon(Icons.filter_alt_outlined)),
        )
      ]),
      body: Consumer<ProductProvider>(
          builder: (context, productProvider, widget) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                padding: const EdgeInsets.only(left: 20, right: 14),
                decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(24)),
                child: TextField(
                  onChanged: (value) {
                    productProvider.search(value);
                  },
                  onSubmitted: (value) {
                    productProvider.search(value);
                  },
                  controller: _searchController,
                  decoration: InputDecoration(
                      fillColor: const Color(0xFFD9D9D9),
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                      hintText: 'What are you looking for?',
                      border: InputBorder.none),
                ),
              ),
              SearchProductsView(
                categoryId: categoryId,
                categoryName: categoryName,
                search: _searchController.text,
              )
            ],
          ),
        );
      }),
    );
  }
}
