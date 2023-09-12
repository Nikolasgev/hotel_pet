import 'package:flutter/material.dart';
import 'package:tz_hotel/components/peculiarities_widget_room.dart';
import 'package:tz_hotel/models/room_info.dart';
import 'package:tz_hotel/views/booking_page.dart';

import 'common_button.dart';
import 'indicator.dart';

class RoomCard extends StatefulWidget {
  const RoomCard({super.key, required this.roomInfo, required this.index});
  final RoomInfo? roomInfo; 
  final int index;

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  
  var activePage = 0;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: imagecarousel(widget.roomInfo?.rooms[widget.index].imageUrls.toList(), widget.index),
                ),
                Text(
                  '${widget.roomInfo?.rooms[widget.index].name}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    height: 1.20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    PeculiaritiesWidgetRoom(
                      roomlInfo: widget.roomInfo,
                      roomIndex: widget.index,
                      index: 0,
                    ),
                    PeculiaritiesWidgetRoom(
                      roomlInfo: widget.roomInfo,
                      roomIndex: widget.index,
                      index: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: ShapeDecoration(
                    color: const Color(0x190D72FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Подробнее о номере',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF0D72FF),
                          fontSize: 16,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.20,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 25,
                        color: Color(0xFF0D72FF),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${widget.roomInfo?.rooms[widget.index].price} ₽',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                        height: 1.20,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '${widget.roomInfo?.rooms[widget.index].pricePer}',
                      style: const TextStyle(
                        color: Color(0xFF828796),
                        fontSize: 16,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        height: 1.20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16,),
                CommonButton(text: 'Выбрать номер', onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BookingPage(
                              ),),
                    );})
              ],
            ),
          ),
        ),
      );
  }
  Stack imagecarousel(List<String>? imageUrls, int index) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 260,
          child: PageView.builder(
            itemCount: widget.roomInfo?.rooms[widget.index].imageUrls.length,
            pageSnapping: true,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              return Container(
                margin: const EdgeInsets.all(0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    '${widget.roomInfo?.rooms[index].imageUrls[pagePosition]}',
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(
                    widget.roomInfo?.rooms[0].imageUrls.length, activePage)),
          ),
        ),
      ],
    );
  }
}

