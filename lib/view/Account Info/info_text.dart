import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    super.key,
    required this.info,
  });

  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 20),
      child: Text(
        info,
        style: const TextStyle(
            color: Color.fromARGB(255, 75, 75, 75), fontSize: 16),
      ),
    );
  }
}