// To parse this JSON data, do
//
//     final bookingInfo = bookingInfoFromJson(jsonString);

import 'dart:convert';

BookingInfo bookingInfoFromJson(String str) => BookingInfo.fromJson(json.decode(str));

String bookingInfoToJson(BookingInfo data) => json.encode(data.toJson());

class BookingInfo {
    int id;
    String hotelName;
    String hotelAdress;
    int horating;
    String ratingName;
    String departure;
    String arrivalCountry;
    String tourDateStart;
    String tourDateStop;
    int numberOfNights;
    String room;
    String nutrition;
    int tourPrice;
    int fuelCharge;
    int serviceCharge;

    BookingInfo({
        required this.id,
        required this.hotelName,
        required this.hotelAdress,
        required this.horating,
        required this.ratingName,
        required this.departure,
        required this.arrivalCountry,
        required this.tourDateStart,
        required this.tourDateStop,
        required this.numberOfNights,
        required this.room,
        required this.nutrition,
        required this.tourPrice,
        required this.fuelCharge,
        required this.serviceCharge,
    });

    factory BookingInfo.fromJson(Map<String, dynamic> json) => BookingInfo(
        id: json["id"],
        hotelName: json["hotel_name"],
        hotelAdress: json["hotel_adress"],
        horating: json["horating"],
        ratingName: json["rating_name"],
        departure: json["departure"],
        arrivalCountry: json["arrival_country"],
        tourDateStart: json["tour_date_start"],
        tourDateStop: json["tour_date_stop"],
        numberOfNights: json["number_of_nights"],
        room: json["room"],
        nutrition: json["nutrition"],
        tourPrice: json["tour_price"],
        fuelCharge: json["fuel_charge"],
        serviceCharge: json["service_charge"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hotel_name": hotelName,
        "hotel_adress": hotelAdress,
        "horating": horating,
        "rating_name": ratingName,
        "departure": departure,
        "arrival_country": arrivalCountry,
        "tour_date_start": tourDateStart,
        "tour_date_stop": tourDateStop,
        "number_of_nights": numberOfNights,
        "room": room,
        "nutrition": nutrition,
        "tour_price": tourPrice,
        "fuel_charge": fuelCharge,
        "service_charge": serviceCharge,
    };
}
