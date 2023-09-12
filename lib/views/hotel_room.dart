import 'package:flutter/material.dart';
import 'package:tz_hotel/components/room_card.dart';
import 'package:tz_hotel/models/room_info.dart';
import '../components/indicator.dart';
import '../models/hotel_info.dart';
import '../services/remote_services.dart';

class HotelRoom extends StatefulWidget {
  const HotelRoom({super.key, required this.hotelInfo});
  final HotelInfo? hotelInfo;

  @override
  State<HotelRoom> createState() => _HotelRoomState();
}

class _HotelRoomState extends State<HotelRoom> {
  RoomInfo? roomInfo;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    roomInfo = await RemoteService().getRoomlInfo();
    if (roomInfo != null) {
      setState(() {
        _isLoaded = true;
      });
    }
  }

  int? _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E9EC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          '${widget.hotelInfo?.name}',
          maxLines: 2,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            height: 1.20,
          ),
        ),
      ),
      body: Visibility(
        visible: _isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return RoomCard(
              roomInfo: roomInfo,
              index: index,
            );
          },
        ),
      ),
    );
  }

  Stack imagecarousel(List<String>? imageUrls) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 260,
          child: PageView.builder(
            itemCount: roomInfo?.rooms[0].imageUrls.length,
            pageSnapping: true,
            onPageChanged: (page) {
              setState(() {
                _activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              return Container(
                margin: const EdgeInsets.all(0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    '${roomInfo?.rooms[0].imageUrls[pagePosition]}',
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
                    roomInfo?.rooms[0].imageUrls.length, _activePage)),
          ),
        ),
      ],
    );
  }
}
