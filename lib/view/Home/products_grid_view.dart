import 'package:e_commerce_app/Provider/product_provider.dart';
import 'package:e_commerce_app/view/Home/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({
    super.key,
  });

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductProvider>(context, listen: false).getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child:
          Consumer<ProductProvider>(builder: (context, productProvider, child) {
        final products = productProvider.getProducts;
        if (productProvider.isLoading) {
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
              itemCount: 4,
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
      }),
    );
  }
}
