import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/employee_model.dart';
import 'getEmployees.dart';

class deleteEmployee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return deleteEmployeeState();
  }
}

Future<EmployeeModel> deleteEmployees( EmployeeModel employee) async {
  var Url = "http://localhost:8080/" + employee.id.toString() + "/remove";
  var response = await http.get(
    Uri.parse(Url),
    headers: <String, String>{
      "Content-Type": "application/json;charset=UTF-8,"
    },
  );
  return EmployeeModel.fromJson(jsonDecode(response.body));
}

class deleteEmployeeState extends State<deleteEmployee> {
  @override
  Widget build(BuildContext context) {
    return  GetEmployees();
  }
}
