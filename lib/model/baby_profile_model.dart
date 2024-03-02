// To parse this JSON data, do
//
//     final babyProfile = babyProfileFromJson(jsonString);

import 'dart:convert';

BabyProfile babyProfileFromJson(String str) => BabyProfile.fromJson(json.decode(str));

String babyProfileToJson(BabyProfile data) => json.encode(data.toJson());

class BabyProfile {
    int? id;
    String? firstName;
    String? lastName;
    DateTime? dateOfBirth;
    String? sex;
    dynamic location;

    BabyProfile({
        this.id,
        this.firstName,
        this.lastName,
        this.dateOfBirth,
        this.sex,
        this.location,
    });

    factory BabyProfile.fromJson(Map<String, dynamic> json) => BabyProfile(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
        sex: json["sex"],
        location: json["Location"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "sex": sex,
        "Location": location,
    };
}
