import 'package:e_commerce_app/Provider/array_image_provider.dart';
import 'package:e_commerce_app/view/Product%20Details/product_image_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageIndicator extends StatelessWidget {
  const ImageIndicator({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<ImageArrayProvider>(builder: (context, image, widget) {
          if (image.getImage.productID == productId) {
            final images = image.getImage.image;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final image = images[index].filename;
                return ProductImageIndicator(product_image: image!);
              },
              itemCount: images!.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
