import 'package:e_commerce_app/view/Cart/show_custom_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({
    super.key, required this.subtotal,
  });
  
  final double subtotal;

  @override
  Widget build(BuildContext context) {
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
            ShowCustomModalBottomSheet(context,subtotal);
          },
          style: const ButtonStyle(),
          child: const Text(
            'Check Out',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
