import 'package:e_commerce_app/Provider/cart_provider.dart';
import 'package:e_commerce_app/view/Cart/cart_product.dart';
import 'package:e_commerce_app/view/Cart/check_out_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            'Cart',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(top: 20, right: 20),
        //     child:
        //         IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        //   )
        // ],
      ),
      body: Consumer<CartProvider>(builder: (context, cart, widget) {
        return Stack(
          children: [
            ListView.builder(
                itemCount: cart.cartItems.length,
                itemBuilder: (context, index) {
                  final items = cart.cartItems[index];
                  return CartProduct(
                    id: items.id,
                    name: items.name,
                    price: items.price,
                    quantity: items.quantity,
                    image: items.image,
                  );
                }),
            CheckOutButton(
              subtotal: cart.subtotalPrice,
            )
          ],
        );
      }),
    );
  }
}
