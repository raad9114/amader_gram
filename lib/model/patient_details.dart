// To parse this JSON data, do
//
//     final patientDetailsModel = patientDetailsModelFromJson(jsonString);

import 'dart:convert';

PatientDetailsModel patientDetailsModelFromJson(String str) => PatientDetailsModel.fromJson(json.decode(str));

String patientDetailsModelToJson(PatientDetailsModel data) => json.encode(data.toJson());

class PatientDetailsModel {
  PatientDetailsModel({
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
  String councilor;
  String diabeticvalue;
  String mothername;


  factory PatientDetailsModel.fromJson(Map<String, dynamic> json) => PatientDetailsModel(
    id: json["id"] == null ? null : json["id"],
    employeeId: json["employee_id"] == null ? null : json["employee_id"],
    uname: json["uname"] == null ? null : json["uname"],
    pname: json["pname"] == null ? null : json["pname"],
    doc: json["doc"] == null ? null : json["doc"],
    sex: json["sex"] == null ? null : json["sex"],
    membership: json["membership"] == null ? null : json["membership"],
    dob: json["dob"] == null ? null : json["dob"],
    address: json["address"] == null ? null : json["address"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    maritalStatus: json["marital_status"] == null ? null : json["marital_status"],
    noChild: json["no_child"] == null ? null : json["no_child"],
    height: json["height"] == null ? null : json["height"],
    weight: json["weight"] == null ? null : json["weight"],
    pulse: json["pulse"] == null ? null : json["pulse"],
    systolic: json["systolic"] == null ? null : json["systolic"],
    diastolic: json["diastolic"] == null ? null : json["diastolic"],
    diabeticStatus: json["diabetic_status"] == null ? null : json["diabetic_status"],
    complainOfDay: json["complain_of_day"] == null ? null : json["complain_of_day"],
    observationMa: json["observation_ma"] == null ? null : json["observation_ma"],
    suggestionMa: json["suggestion_ma"] == null ? null : json["suggestion_ma"],
    sheduleVc: json["shedule_vc"] == null ? null : json["shedule_vc"],
    suggestionMo: json["suggestion_mo"] == null ? null : json["suggestion_mo"],
      councilor: json["councilor"] == null ? null : json["councilor"],
      diabeticvalue: json["diabeticvalue"] == null ? null : json["diabeticvalue"],
      mothername: json["mothername"] == null ? null : json["mothername"],

  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "employee_id": employeeId == null ? null : employeeId,
    "uname": uname == null ? null : uname,
    "pname": pname == null ? null : pname,
    "doc": doc == null ? null : doc,
    "sex": sex == null ? null : sex,
    "membership": membership == null ? null : membership,
    "dob": dob == null ? null : dob,
    "address": address == null ? null : address,
    "mobile": mobile == null ? null : mobile,
    "marital_status": maritalStatus == null ? null : maritalStatus,
    "no_child": noChild == null ? null : noChild,
    "height": height == null ? null : height,
    "weight": weight == null ? null : weight,
    "pulse": pulse == null ? null : pulse,
    "systolic": systolic == null ? null : systolic,
    "diastolic": diastolic == null ? null : diastolic,
    "diabetic_status": diabeticStatus == null ? null : diabeticStatus,
    "complain_of_day": complainOfDay == null ? null : complainOfDay,
    "observation_ma": observationMa == null ? null : observationMa,
    "suggestion_ma": suggestionMa == null ? null : suggestionMa,
    "shedule_vc": sheduleVc == null ? null : sheduleVc,
    "suggestion_mo": suggestionMo == null ? null : suggestionMo,
    "councilor": councilor == null ? null : councilor,
    "diabeticvalue": diabeticvalue == null ? null : diabeticvalue,

    "mothername": mothername == null ? null : mothername

  };
}
