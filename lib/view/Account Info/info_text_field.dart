import 'package:flutter/material.dart';

class InfoTextField extends StatelessWidget {
  const InfoTextField({
    super.key, required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF5F5F5),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Color(0xffD1CECE)),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.purple),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}