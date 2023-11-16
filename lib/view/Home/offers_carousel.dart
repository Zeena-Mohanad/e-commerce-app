import 'package:flutter/material.dart';

import '../Product Details/product_details.dart';

class OffersCarousel extends StatelessWidget {
  const OffersCarousel({
    super.key,
    required this.cardImage,
    required this.id,
  });

  final String cardImage;
  final String id;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            width: screenWidth,
            decoration: BoxDecoration(
              color: const Color(0xff000066),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Offers',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Text(
                  '15% discount for\nthe first transaction',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                Container(
                    margin: EdgeInsets.only(top: 16),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailsPage(
                                      productId: id,
                                    )),
                          );
                        },
                        child: const Text(
                          'Shop Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )))
              ],
            )),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(
                  cardImage,
                ),
                width: 160,
                height: 160,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
