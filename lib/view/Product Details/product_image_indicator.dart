import 'package:flutter/material.dart';

class ProductImageIndicator extends StatelessWidget {
  const ProductImageIndicator({
    super.key,
    required this.product_image,
  });

  final String product_image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: const Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(8)),
          child: Image(image: NetworkImage(product_image)),
        ),
      ),
    );
  }
}
