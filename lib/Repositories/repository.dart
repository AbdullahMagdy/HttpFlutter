import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lets_connect/Model/employee_model.dart';

import '../Screens/addEmployee.dart';

class RepositoryClass {
  //base url. url end point
  static const String _baseUrl = "http://localhost:8080/employees";

  //Api key
  //static const String _apiKey = "01cc8328d04c516c03c84af29cd9c0d9";
  final http.Client _client;

  RepositoryClass({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  Future<List<EmployeeModel>> getEmployees() async {
    var data = await http.get(Uri.parse('http://localhost:8080/employees'));
    var jsonData = json.decode(data.body);

    List<EmployeeModel> employeesList = [];
    for (var e in jsonData) {
      EmployeeModel employees = EmployeeModel(lastName: 'l', firstName: 'o');
      employees.id = e["id"];
      employees.firstName = e["firstName"];
      employees.lastName = e["lastName"];
      employeesList.add(employees);
      print(employees.toJson());
    }
    print(employeesList.toString());
    return employeesList;
  }

  Future<EmployeeModel> registerEmployeesToCubit(
      String firstName, String lastName) async {
    var Url = "http://localhost:8080/employee";
    var response = await http.post(Uri.parse(Url),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "firstName": firstName,
          "lastName": lastName,
        }));

    String responseString = response.body;
    if (response.statusCode == 200) {

      // return MyAlertDialog(
      //     title: 'Backend Response', content: const Text("New Employee Added").toString());
      // showDialog(
      //   context: context,
      //   barrierDismissible: true,
      //   builder: (BuildContext dialogContext) {
      //     return MyAlertDialog(
      //         title: 'Backend Response', content: response.body);
      //   },
      // );
      return EmployeeModel(firstName: firstName , lastName: lastName);
    }

    //return EmployeeModel();
    // return MyAlertDialog(
    //     title: 'Backend Response', content: const Text("Canot add employee").toString());
    return EmployeeModel(firstName: firstName , lastName: lastName);

  }
  

  Future<String> deleteEmployees(int id) async {
    var Url = "http://localhost:8080/employees/" + id.toString() + "/delete";
    var response = await http.delete(
      Uri.parse(Url),
      headers: <String, String>{
        "Content-Type": "application/json;charset=UTF-8,"
      },
    );
    return response.body;
  }
}
