
import 'package:flutter/cupertino.dart';
import 'package:lets_connect/Model/employee_model.dart';

abstract class AddState{

}

class SuccessAddState extends AddState{

  Future<EmployeeModel> employeeModel;
  SuccessAddState(this.employeeModel);

}

class LoadingAddState extends AddState{

}