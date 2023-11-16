import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(8)),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return '$label is required';
                }
                return null;
              },
              controller: controller,
              decoration:
                  InputDecoration(hintText: hintText, border: InputBorder.none),
              onSaved: (value) {
                if (label == 'User Name') {
                  controller.text = value!;
                } else if (label == 'Email') {
                  controller.text = value!;
                } else if (label == 'Password') {
                  controller.text = value!;
                } else if (label == 'Confirm Password') {
                  controller.text = value!;
                } else if (label == 'Phone Number') {
                  controller.text = value!;
                } else if (label == 'Gender') {
                  controller.text = value!;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
