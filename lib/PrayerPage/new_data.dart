// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

class Data {
    final String provider;
    final int code;
    final String year;
    final String month;
    final String place;
    final String attributes;
    final String times;

    Data({
        required this.provider,
        required this.code,
        required this.year,
        required this.month,
        required this.place,
        required this.attributes,
        required this.times,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        provider: json["provider"],
        code: json["code"],
        year: json["year"],
        month: json["month"],
        place: json["place"],
        attributes: json["attributes"],
        times: json["times"],
    );

    Map<String, dynamic> toJson() => {
        "provider": provider,
        "code": code,
        "year": year,
        "month": month,
        "place": place,
        "attributes": attributes,
        "times": times,
    };
}

