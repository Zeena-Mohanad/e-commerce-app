import 'package:e_commerce_app/Provider/array_image_provider.dart';
import 'package:e_commerce_app/Provider/product_provider.dart';
import 'package:e_commerce_app/view/Product%20Details/add_to-cart_button.dart';
import 'package:e_commerce_app/view/Product%20Details/product_details_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.productId});

  final String productId;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Text(
            'Product Deatils',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(top: 20, right: 20),
        //     child:
        //         IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        //   )
        //],
      ),
      body: Consumer2<ProductProvider, ImageArrayProvider>(
          builder: (contextcontext, product, image, Widget? child) {
        final products = product.getProducts
            .firstWhere((element) => element.id == widget.productId);
        return Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 430,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(163, 201, 201, 201),
                            offset: Offset(0, 5.0),
                            blurRadius: 6,
                            spreadRadius: 2)
                      ]),
                  child: Image(
                    image: NetworkImage(products.image!),
                  ),
                ),
                // ProductSliderImage(
                //   productId: widget.productId,
                // ),
                // ImageIndicator(
                //   productId: widget.productId,
                // ),
                ProductDetailsText(
                  category: products.department!.name!,
                  productName: products.name!,
                  price: products.price!,
                  description: products.description!,
                ),
              ],
            ),
          ),
          AddToCartButton(
            productId: widget.productId,
            name: products.name!,
            price: products.price!,
            image: products.image!,
          )
        ]);
      }),
    );
  }
}
