// To parse this JSON data, do
//
//     final programStatus = programStatusFromJson(jsonString);

import 'dart:convert';

List<ProgramStatus> programStatusFromJson(String str) => List<ProgramStatus>.from(json.decode(str).map((x) => ProgramStatus.fromJson(x)));

String programStatusToJson(List<ProgramStatus> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProgramStatus {
    Program? program;
    List<StatusElement>? statuses;

    ProgramStatus({
        this.program,
        this.statuses,
    });

    factory ProgramStatus.fromJson(Map<String, dynamic> json) => ProgramStatus(
        program: json["program"] == null ? null : Program.fromJson(json["program"]),
        statuses: json["statuses"] == null ? [] : List<StatusElement>.from(json["statuses"]!.map((x) => StatusElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "program": program?.toJson(),
        "statuses": statuses == null ? [] : List<dynamic>.from(statuses!.map((x) => x.toJson())),
    };
}

class Program {
    int? id;
    List<Vaccine>? vaccines;

    Program({
        this.id,
        this.vaccines,
    });

    factory Program.fromJson(Map<String, dynamic> json) => Program(
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

class StatusElement {
    StatusStatus? status;

    StatusElement({
        this.status,
    });

    factory StatusElement.fromJson(Map<String, dynamic> json) => StatusElement(
        status: json["status"] == null ? null : StatusStatus.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
    };
}

class StatusStatus {
    int? id;
    int? program;
    String? childName;
    bool? isTaken;

    StatusStatus({
        this.id,
        this.program,
        this.childName,
        this.isTaken,
    });

    factory StatusStatus.fromJson(Map<String, dynamic> json) => StatusStatus(
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
