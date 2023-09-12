import 'package:flutter/material.dart';
import 'package:tz_hotel/models/hotel_info.dart';
import 'package:tz_hotel/services/remote_services.dart';
import 'package:tz_hotel/views/hotel_room.dart';

import '../components/common_button.dart';
import '../components/indicator.dart';
import '../components/my_card.dart';
import '../components/peculiarities_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HotelInfo? hotelInfo;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getData();
    });
  }

  getData() async {
    hotelInfo = await RemoteService().getHotelInfo();
    if (hotelInfo != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  int? _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawerEdgeDragWidth: 20,
      backgroundColor: const Color(0xFFE8E9EC),
      appBar: AppBar(
        title: const Text(
          'Отель',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            height: 1.20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    imagecarousel(hotelInfo?.imageUrls.toList()),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: ShapeDecoration(
                          color: const Color(0x33FFC600),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 15,
                              color: Color(0xFFFFA800),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              '${hotelInfo?.rating} ${hotelInfo?.ratingName}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFFFFA800),
                                fontSize: 16,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                height: 1.20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      '${hotelInfo?.name}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1.20,
                      ),
                    ),
                    // const SizedBox(height: 8,),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.centerLeft,
                      ),
                      child: Text(
                        '${hotelInfo?.adress}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.20,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          //todo
                          'от ${hotelInfo?.minimalPrice} ₽',
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
                          '${hotelInfo?.priceForIt.toLowerCase()}',
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
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Об отеле',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1.20,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PeculiaritiesWidget(
                          hotelInfo: hotelInfo,
                          index: 0,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            PeculiaritiesWidget(
                              hotelInfo: hotelInfo,
                              index: 1,
                            ),
                            PeculiaritiesWidget(
                              hotelInfo: hotelInfo,
                              index: 2,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        PeculiaritiesWidget(
                          hotelInfo: hotelInfo,
                          index: 3,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '${hotelInfo?.aboutTheHotel.description}',
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        height: 1.20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          MyCard(
                            title: 'Удобства',
                            subtitle: 'Самое необходимое',
                            image: 'emoji-happy',
                          ),
                          const SizedBox(
                            height: 10,
                            child: Divider(
                              height: 1,
                              color: Color(0xff82879626),
                            ),
                          ),
                          MyCard(
                            title: 'Что включено',
                            subtitle: 'Самое необходимое',
                            image: 'tick-square',
                          ),
                          const SizedBox(
                            height: 10,
                            child: Divider(
                              height: 1,
                              color: Color(0xff82879626),
                            ),
                          ),
                          MyCard(
                            title: 'Что не включено',
                            subtitle: 'Самое необходимое',
                            image: 'close-square',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 100,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 12, bottom: 28),
                child: CommonButton(
                  text: 'К выбору номера',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HotelRoom(
                          hotelInfo: hotelInfo,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
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
            itemCount: imageUrls?.length,
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
                    '${imageUrls?[pagePosition]}',
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(imageUrls?.length, _activePage)),
          ),
        ),
      ],
    );
  }
}

// List<Widget> indicators(imagesLength, currentIndex) {
//   return List<Widget>.generate(imagesLength, (index) {
//     return Row(
//       children: [
//         Container(
//           margin: const EdgeInsets.all(3),
//           width: 10,
//           height: 10,
//           decoration: BoxDecoration(
//               color: currentIndex == index ? Colors.black : Colors.black26,
//               shape: BoxShape.circle),
//         ),
//       ],
//     );
//   });
// }
