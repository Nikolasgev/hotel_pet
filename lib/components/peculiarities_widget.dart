import 'package:flutter/material.dart';

import '../models/hotel_info.dart';

class PeculiaritiesWidget extends StatelessWidget {
  const PeculiaritiesWidget(
      {super.key, required this.hotelInfo, required this.index});

  final int index;
  final HotelInfo? hotelInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: ShapeDecoration(
          color: const Color(0xFFFBFBFC),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text(
          '${hotelInfo?.aboutTheHotel.peculiarities[index]}',
          style: const TextStyle(
            color: Color(0xFF828796),
            fontSize: 16,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            height: 1.20,
          ),
        ),
      ),
    );
  }
}