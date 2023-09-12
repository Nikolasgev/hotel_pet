import 'package:flutter/material.dart';
import 'package:tz_hotel/models/room_info.dart';

class PeculiaritiesWidgetRoom extends StatelessWidget {
  const PeculiaritiesWidgetRoom(
      {super.key, required this.roomlInfo, required this.index, required this.roomIndex});

  final int index;
  final int roomIndex;
  final RoomInfo? roomlInfo;

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
          '${roomlInfo?.rooms[roomIndex].peculiarities[index]}',
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