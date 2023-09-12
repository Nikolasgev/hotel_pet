import 'package:flutter/material.dart';

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength = 0, (index) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(3),
          width: 7,
          height: 7,
          decoration: BoxDecoration(
              color: currentIndex == index ? Colors.black : Colors.black26,
              shape: BoxShape.circle),
        ),
      ],
    );
  });
}