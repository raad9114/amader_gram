// To parse this JSON data, do
//
//     final searchById = searchByIdFromJson(jsonString);

import 'dart:convert';

List<SearchById> searchByIdFromJson(String str) => List<SearchById>.from(json.decode(str).map((x) => SearchById.fromJson(x)));

String searchByIdToJson(List<SearchById> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchById {
  SearchById({
    required this.id,
    required this.employeeId,
    required this.uname,
    required this.pname,
    required this.doc,
    required this.sex,
    required this.membership,
    required this.dob,
    required this.address,
    required this.mobile,
    required this.maritalStatus,
    required this.noChild,
    required this.height,
    required this.weight,
    required this.pulse,
    required this.systolic,
    required this.diastolic,
    required this.diabeticStatus,
    required this.complainOfDay,
    required this.observationMa,
    required this.suggestionMa,
    required this.sheduleVc,
    required this.suggestionMo,
    required this.createdAt,
    required this.councilor,
    required this.diabeticvalue,
    required this.mothername,
  });

  String id;
  String employeeId;
  String uname;
  String pname;
  String doc;
  String sex;
  String membership;
  String dob;
  String address;
  String mobile;
  String maritalStatus;
  String noChild;
  String height;
  String weight;
  String pulse;
  String systolic;
  String diastolic;
  String diabeticStatus;
  String complainOfDay;
  String observationMa;
  String suggestionMa;
  String sheduleVc;
  String suggestionMo;
  DateTime createdAt;
  String councilor;
  String diabeticvalue;
  String mothername;


  factory SearchById.fromJson(Map<String, dynamic> json) => SearchById(
    id: json["pid"],
    employeeId: json["employee_id"],
    uname: json["uname"],
    pname: json["pname"],
    doc: json["doc"],
    sex: json["sex"],
    membership: json["membership"],
    dob: json["dob"],
    address: json["address"],
    mobile: json["mobile"],
    maritalStatus: json["marital_status"],
    noChild: json["no_child"],
    height: json["height"],
    weight: json["weight"],
    pulse: json["pulse"],
    systolic: json["systolic"],
    diastolic: json["diastolic"],
    diabeticStatus: json["diabetic_status"],
    complainOfDay: json["complain_of_day"],
    observationMa: json["observation_ma"],
    suggestionMa: json["suggestion_ma"],
    sheduleVc: json["shedule_vc"],
    suggestionMo: json["suggestion_mo"],
    createdAt: DateTime.parse(json["created_at"]),
      councilor: json["councilor"],
      diabeticvalue: json["diabeticvalue"],
      mothername: json["mothername"]
  );

  Map<String, dynamic> toJson() => {
    "pid": id,
    "employee_id": employeeId,
    "uname": uname,
    "pname": pname,
    "doc": doc,
    "sex": sex,
    "membership": membership,
    "dob": dob,
    "address": address,
    "mobile": mobile,
    "marital_status": maritalStatus,
    "no_child": noChild,
    "height": height,
    "weight": weight,
    "pulse": pulse,
    "systolic": systolic,
    "diastolic": diastolic,
    "diabetic_status": diabeticStatus,
    "complain_of_day": complainOfDay,
    "observation_ma": observationMa,
    "suggestion_ma": suggestionMa,
    "shedule_vc": sheduleVc,
    "suggestion_mo": suggestionMo,
    "created_at": createdAt.toIso8601String(),
    "councilor": councilor,
    "diabeticvalue": diabeticvalue,
    "mothername": mothername,
  };
}
