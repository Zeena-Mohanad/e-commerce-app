import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final String price;
  int quantity;
  final String image;

  CartItem(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity,
      required this.image});
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(
      {required String productId,
      required String name,
      required String price,
      required String image}) {
    // Check if an item with the same productId already exists in the cart
    final existingCartItemIndex =
        _cartItems.indexWhere((item) => item.id == productId);

    if (existingCartItemIndex != -1) {
      // If the item exists, increase its quantity
      _cartItems[existingCartItemIndex].quantity += 1;
    } else {
      // If the item doesn't exist, add it to the cart
      _cartItems.add(
        CartItem(
          id: productId,
          name: name,
          price: price,
          quantity: 1,
          image: image,
        ),
      );
    }

    notifyListeners();
  }

  void removeFromCart(String productId) {
    final existingCartItemIndex =
        _cartItems.indexWhere((item) => item.id == productId);

    if (existingCartItemIndex != -1) {
      final existingCartItem = _cartItems[existingCartItemIndex];
      if (existingCartItem.quantity > 1) {
        existingCartItem.quantity -= 1;
      } else {
        _cartItems.removeAt(existingCartItemIndex);
      }
      notifyListeners();
    }
  }

  double get subtotalPrice {
    double subtotal = 0.0;

    for (var element in cartItems) {
      subtotal += double.parse(element.price) * element.quantity;
    }
    return subtotal;
  }
}
