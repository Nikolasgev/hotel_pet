import 'package:flutter/material.dart';

class PriceLine extends StatelessWidget {
  const PriceLine({
    super.key,
    required this.text,
    required this.value,
    this.varStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w400,
      height: 1.20,
    ),
  });

  final String text;
  final value;
  final TextStyle varStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF828796),
              fontSize: 16,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              height: 1.20,
            ),
          ),
          Text(
            '$value ₽',
            textAlign: TextAlign.right,
            style: varStyle,
          ),
        ],
      ),
    );
  }
}