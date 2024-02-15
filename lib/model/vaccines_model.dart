// To parse this JSON data, do
//
//     final vaccines = vaccinesFromJson(jsonString);

import 'dart:convert';

List<Vaccines> vaccinesFromJson(String str) => List<Vaccines>.from(json.decode(str).map((x) => Vaccines.fromJson(x)));

String vaccinesToJson(List<Vaccines> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vaccines {
    int? id;
    List<Vaccine>? vaccines;

    Vaccines({
        this.id,
        this.vaccines,
    });

    factory Vaccines.fromJson(Map<String, dynamic> json) => Vaccines(
        id: json["id"],
        vaccines: json["vaccines"] == null ? [] : List<Vaccine>.from(json["vaccines"]!.map((x) => Vaccine.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vaccines": vaccines == null ? [] : List<dynamic>.from(vaccines!.map((x) => x.toJson())),
    };
}

class Vaccine {
    int? id;
    String? vaccine;

    Vaccine({
        this.id,
        this.vaccine,
    });

    factory Vaccine.fromJson(Map<String, dynamic> json) => Vaccine(
        id: json["id"],
        vaccine: json["vaccine"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vaccine": vaccine,
    };
}
