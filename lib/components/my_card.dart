import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 0,
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Image.asset('assets/icons/$image.png'),
                ),
                title: Text(title),
                subtitle: Text(subtitle),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}