import 'package:e_commerce_app/Provider/category_products_provider.dart';
import 'package:e_commerce_app/Provider/product_provider.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/view/Home/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchProductsView extends StatefulWidget {
  const SearchProductsView({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.search,
  });

  final String categoryId;
  final String categoryName;
  final String search;

  @override
  State<SearchProductsView> createState() => _SearchProductsViewState();
}

class _SearchProductsViewState extends State<SearchProductsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CategoryProductsProvider>(context, listen: false)
          .getAllCategoryProducts(widget.categoryId);
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductProvider>(context, listen: false).getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Consumer2<CategoryProductsProvider, ProductProvider>(
          builder: (context, category, product, child) {
        final categoryProducts = category.getProducts;
        final products = product.getProducts;
        final search = product.getSearch;
        if (category.isLoading || product.isLoading) {
          return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                mainAxisExtent: 230,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return const Center(child: CircularProgressIndicator());
              });
        } else if (widget.search.isEmpty && widget.categoryId.isEmpty) {
          return SearchGridView(products: products);
        } else if (widget.search.isNotEmpty) {
          return SearchGridView(products: search);
        } else {
          return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                mainAxisExtent: 230,
              ),
              itemCount: categoryProducts.length,
              itemBuilder: (context, index) {
                final categoryProduct = categoryProducts[index];
                final departmentId = category.getProducts[index].department!.id;
                if (departmentId == widget.categoryId) {
                  return ProductGrid(
                    image: categoryProduct.image!,
                    name: categoryProduct.name!,
                    price: categoryProduct.price!,
                    id: categoryProduct.id!,
                  );
                }
                return null;
              });
        }
      }),
    );
  }
}

class SearchGridView extends StatelessWidget {
  const SearchGridView({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        key: ValueKey(products.length),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          mainAxisExtent: 230,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductGrid(
            image: product.image!,
            name: product.name!,
            price: product.price!,
            id: product.id!,
          );
        });
  }
}
