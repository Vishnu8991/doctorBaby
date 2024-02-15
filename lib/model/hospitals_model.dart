// To parse this JSON data, do
//
//     final hospitals = hospitalsFromJson(jsonString);

import 'dart:convert';

List<Hospitals> hospitalsFromJson(String str) => List<Hospitals>.from(json.decode(str).map((x) => Hospitals.fromJson(x)));

String hospitalsToJson(List<Hospitals> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hospitals {
    int? id;
    String? name;
    String? location;
    int? slotsAvailable;
    List<int>? programsAvailable;
    List<ProgramsDetail>? programsDetails;

    Hospitals({
        this.id,
        this.name,
        this.location,
        this.slotsAvailable,
        this.programsAvailable,
        this.programsDetails,
    });

    factory Hospitals.fromJson(Map<String, dynamic> json) => Hospitals(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        slotsAvailable: json["slots_available"],
        programsAvailable: json["programs_available"] == null ? [] : List<int>.from(json["programs_available"]!.map((x) => x)),
        programsDetails: json["programs_details"] == null ? [] : List<ProgramsDetail>.from(json["programs_details"]!.map((x) => ProgramsDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "slots_available": slotsAvailable,
        "programs_available": programsAvailable == null ? [] : List<dynamic>.from(programsAvailable!.map((x) => x)),
        "programs_details": programsDetails == null ? [] : List<dynamic>.from(programsDetails!.map((x) => x.toJson())),
    };
}

class ProgramsDetail {
    List<Vaccine>? vaccines;

    ProgramsDetail({
        this.vaccines,
    });

    factory ProgramsDetail.fromJson(Map<String, dynamic> json) => ProgramsDetail(
        vaccines: json["vaccines"] == null ? [] : List<Vaccine>.from(json["vaccines"]!.map((x) => vaccineValues.map[x]!)),
    );

    Map<String, dynamic> toJson() => {
        "vaccines": vaccines == null ? [] : List<dynamic>.from(vaccines!.map((x) => vaccineValues.reverse[x])),
    };
}

enum Vaccine {
    DP_TW,
    HEP_B,
    HIB,
    IPV_OPV,
    MMR,
    OPV,
    TCV
}

final vaccineValues = EnumValues({
    "DPTw": Vaccine.DP_TW,
    "HepB": Vaccine.HEP_B,
    "Hib": Vaccine.HIB,
    "IPV/OPV": Vaccine.IPV_OPV,
    "MMR": Vaccine.MMR,
    "OPV": Vaccine.OPV,
    "TCV": Vaccine.TCV
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
