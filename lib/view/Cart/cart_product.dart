import 'package:e_commerce_app/Provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.id,
    required this.image,
  });

  final String id;
  final String name;
  final String price;
  final int quantity;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 80,
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Checkbox(
            //     value: isCheacked,
            //     onChanged: (value) {
            //       onChangedCheckbox(value);
            //     }),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(8)),
              child: Image(
                image: NetworkImage(image),
              ),
              // child: const Icon(
              //   Icons.image,
              //   size: 36,
              //   color: Color.fromARGB(160, 109, 109, 109),
              // ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 140,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'IQD ${double.parse(price) * quantity}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            Consumer<CartProvider>(builder: (context, cartProvider, widget) {
              return Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        cartProvider.removeFromCart(
                            id); // Implement removeFromCart in CartProvider
                      },
                    ),
                    Text(quantity.toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        cartProvider.addToCart(
                          productId: id,
                          name: name,
                          price: price,
                          image: image,
                        );
                      },
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
