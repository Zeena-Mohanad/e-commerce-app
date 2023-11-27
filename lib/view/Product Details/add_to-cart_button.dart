import 'package:e_commerce_app/Provider/cart_provider.dart';
import 'package:e_commerce_app/view/Cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.productId,
    required this.name,
    required this.price,
    required this.image,
  });

  final String productId;
  final String name;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, widget) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
          height: 90,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color.fromARGB(169, 129, 129, 129),
                blurRadius: 8,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              cart.addToCart(
                  productId: productId, name: name, price: price, image: image);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            style: const ButtonStyle(),
            child: const Text(
              'Add to cart',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      );
    });
  }
}
