
import 'dart:async';

import 'package:lets_connect/Repositories/repository.dart';
import 'package:lets_connect/states/AddState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_connect/states/GetState.dart';

import '../Model/employee_model.dart';

class GetCubit extends Cubit<GetState>{

  RepositoryClass repositoryObject;

  GetCubit(this.repositoryObject) : super(LoadingGetState());


   Future<List<EmployeeModel>> getEmployees() async{

    emit(LoadingGetState());
    List<EmployeeModel> employees = await repositoryObject.getEmployees();
    var timer = Timer(const Duration(seconds: 3), () => emit(SuccessGetState(employees)));

    return employees;

  }

}