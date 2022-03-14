// import 'dart:convert';
//
// EmployeeModel employeeModelJson(String str) =>
//     EmployeeModel.fromJson(json.decode(str));
//
// String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());
//
// class EmployeeModel {
//   int id;
//   String firstName;
//   String lastName;
//
//   EmployeeModel({required this.id, required this.firstName, required this.lastName});
//
//   factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
//       firstName: json["firstName"], lastName: json["lastName"], id: json["id"]);
//
//   Map<String, dynamic> toJson() => {
//     "firstName": firstName,
//     "lastName": lastName,
//     'id': id,
//   };
//
//   String get firstname => firstName;
//
//   String get lastname => lastName;
// }










// previous class

// class EmployeeModel {
//
//   int? id;
//   String? firstName;
//   String? lastName;
//
//   EmployeeModel({ this.firstName, this.lastName});
//
//
//   EmployeeModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['firstName'] = firstName;
//     data['lastName'] = lastName;
//     return data;
//   }
// }

import 'package:json_annotation/json_annotation.dart';
part 'employee_model.g.dart';
@JsonSerializable()
class EmployeeModel{

  late int id;
  late String firstName;
  late String lastName;

  EmployeeModel({required this.firstName , required this.lastName});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => _$EmployeeModelFromJson(json);

   Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);



}