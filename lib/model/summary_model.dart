// To parse this JSON data, do
//
//     final summary = summaryFromJson(jsonString);

import 'dart:convert';

List<Summary> summaryFromJson(String str) => List<Summary>.from(json.decode(str).map((x) => Summary.fromJson(x)));

String summaryToJson(List<Summary> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Summary {
    Status? status;

    Summary({
        this.status,
    });

    factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
    };
}

class Status {
    int? id;
    int? program;
    String? childName;
    bool? isTaken;

    Status({
        this.id,
        this.program,
        this.childName,
        this.isTaken,
    });

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        program: json["program"],
        childName: json["child_name"],
        isTaken: json["is_taken"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "program": program,
        "child_name": childName,
        "is_taken": isTaken,
    };
}
