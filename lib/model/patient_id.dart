// To parse this JSON data, do
//
//     final patientId = patientIdFromJson(jsonString);

import 'dart:convert';

PatientId patientIdFromJson(String str) => PatientId.fromJson(json.decode(str));

String patientIdToJson(PatientId data) => json.encode(data.toJson());

class PatientId {
  PatientId({
    required this.pid,
  });

  String pid;

  factory PatientId.fromJson(Map<String, dynamic> json) => PatientId(
    pid: json["pid"],
  );

  Map<String, dynamic> toJson() => {
    "pid": pid,
  };
}
