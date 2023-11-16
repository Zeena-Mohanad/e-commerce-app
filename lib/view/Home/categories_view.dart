import 'package:e_commerce_app/Provider/category_provider.dart';
import 'package:e_commerce_app/view/Home/category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({
    super.key,
  });

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CategoryProvider>(context, listen: false).getAllCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Consumer<CategoryProvider>(
          builder: (BuildContext context, categoryProvider, Widget? child) {
            final categories = categoryProvider.getCategories;
            if (categoryProvider.isLoading) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Center(child: CircularProgressIndicator())),
                  );
                },
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Category(
                    image: category.image!,
                    name: category.name!,
                    categoryId: category.id!,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
