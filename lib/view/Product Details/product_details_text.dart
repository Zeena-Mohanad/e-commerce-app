import 'package:flutter/material.dart';

class ProductDetailsText extends StatelessWidget {
  const ProductDetailsText({
    super.key,
    required this.category,
    required this.productName,
    required this.price,
    required this.description,
  });

  final String category;
  final String productName;
  final String price;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 120, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              category,
              style: const TextStyle(
                  color: Color.fromARGB(255, 90, 90, 90), fontSize: 16),
            ),
          ),
          Text(
            productName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "IQD $price",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              "Description",
              style: TextStyle(
                  color: Color.fromARGB(255, 90, 90, 90), fontSize: 16),
            ),
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
