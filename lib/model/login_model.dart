// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.uid,
    required this.employeeId,
    required this.username,
    required this.password,
    required this.name,
    required this.designation,
    required this.email,
    required this.contactNumber,
    required this.createdAt,
    required this.role,
  });

  String uid;
  String employeeId;
  String username;
  String password;
  String name;
  String designation;
  String email;
  String contactNumber;
  String role;
  DateTime createdAt;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    uid: json["uid"],
    employeeId: json["employee_id"],
    username: json["username"],
    password: json["password"],
    name: json["name"],
    designation: json["designation"],
    email: json["email"],
    contactNumber: json["contact_number"],
    role: json["role"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "employee_id": employeeId,
    "username": username,
    "password": password,
    "name": name,
    "designation": designation,
    "email": email,
    "contact_number": contactNumber,
    "role": role,
    "created_at": createdAt.toIso8601String(),
  };
}
