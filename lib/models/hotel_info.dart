import 'dart:convert';

HotelInfo hotelInfoFromJson(String str) => HotelInfo.fromJson(json.decode(str));

String hotelInfoToJson(HotelInfo data) => json.encode(data.toJson());

class HotelInfo {
    int? id;
    String? name;
    String? adress;
    int? minimalPrice;
    String priceForIt;
    int? rating;
    String? ratingName;
    List<String> imageUrls;
    AboutTheHotel aboutTheHotel;

    HotelInfo({
        required this.id,
        required this.name,
        required this.adress,
        required this.minimalPrice,
        required this.priceForIt,
        required this.rating,
        required this.ratingName,
        required this.imageUrls,
        required this.aboutTheHotel,
    });

    factory HotelInfo.fromJson(Map<String, dynamic> json) => HotelInfo(
        id: json["id"],
        name: json["name"],
        adress: json["adress"],
        minimalPrice: json["minimal_price"],
        priceForIt: json["price_for_it"],
        rating: json["rating"],
        ratingName: json["rating_name"],
        imageUrls: List<String>.from(json["image_urls"].map((x) => x)),
        aboutTheHotel: AboutTheHotel.fromJson(json["about_the_hotel"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "adress": adress,
        "minimal_price": minimalPrice,
        "price_for_it": priceForIt,
        "rating": rating,
        "rating_name": ratingName,
        "image_urls": List<dynamic>.from(imageUrls.map((x) => x)),
        "about_the_hotel": aboutTheHotel.toJson(),
    };
}

class AboutTheHotel {
    String description;
    List<String> peculiarities;

    AboutTheHotel({
        required this.description,
        required this.peculiarities,
    });

    factory AboutTheHotel.fromJson(Map<String, dynamic> json) => AboutTheHotel(
        description: json["description"],
        peculiarities: List<String>.from(json["peculiarities"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "peculiarities": List<dynamic>.from(peculiarities.map((x) => x)),
    };
}