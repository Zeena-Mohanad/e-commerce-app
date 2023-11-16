import 'package:e_commerce_app/Provider/array_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductSliderImage extends StatefulWidget {
  const ProductSliderImage({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  State<ProductSliderImage> createState() => _ProductSliderImageState();
}

class _ProductSliderImageState extends State<ProductSliderImage> {
  late PageController _pageController;
  int activePage = 0;

  void slideActivePage(value) {
    setState(() {
      activePage = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ImageArrayProvider>(context, listen: false)
          .getAllImages(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Consumer<ImageArrayProvider>(
            builder: (context, image, Widget? child) {
          if (image.getImage.productID == widget.productId) {
            final images = image.getImage.image;
            return PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  slideActivePage;
                },
                itemCount: images!.length,
                pageSnapping: true,
                itemBuilder: (context, index) {
                  final image = images[index].filename;
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image(
                      image: NetworkImage(image!),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
