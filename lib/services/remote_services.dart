import 'package:tz_hotel/models/booking_info.dart';
import 'package:tz_hotel/models/hotel_info.dart';
import 'package:http/http.dart' as http;
import 'package:tz_hotel/models/room_info.dart';

class RemoteService 
{
  Future<HotelInfo?> getHotelInfo() async {
    var client = http.Client();

    var uri = Uri.parse('https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return hotelInfoFromJson(json);
    }
    return null;

  }

  Future<RoomInfo?> getRoomlInfo() async {
    var client = http.Client();

    var uri = Uri.parse('https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return roomInfoFromJson(json);
    }
    return null;

  }

  Future<BookingInfo?> getBookingInfo() async {
    var client = http.Client();

    var uri = Uri.parse('https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return bookingInfoFromJson(json);
    }
    return null;

  }
}