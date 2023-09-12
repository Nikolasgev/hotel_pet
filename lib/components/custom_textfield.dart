import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.lable,
    this.onCanged,
    this.hintText,
    this.formatters,
    this.controller,
  });

  final TextEditingController? controller;
  final String lable;
  final String? hintText;
  final List<TextInputFormatter>? formatters;
  final Function(String)? onCanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: const Color(0xFFF6F6F9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 10, bottom: 5),
        child: TextField(
          controller: controller,
          // cursorHeight: 2,
          onChanged: onCanged,
          scrollPadding: EdgeInsets.zero,
          inputFormatters: formatters,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              label: Text(
                lable,
                style: const TextStyle(
                  color: Color(0xFFA8ABB6),
                  fontSize: 17,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  height: 1.20,
                  letterSpacing: 0.17,
                ),
              ),
              hintText: hintText,
              isDense: true,
              hintStyle: const TextStyle(
                color: Color(0xFF14132A),
                fontSize: 16,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                height: 1.10,
                letterSpacing: 0.75,
              ),
              border: InputBorder.none),
        ),
      ),
    );
  }
}