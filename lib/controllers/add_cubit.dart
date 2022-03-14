
import 'dart:async';

import 'package:lets_connect/Repositories/repository.dart';
import 'package:lets_connect/states/AddState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/employee_model.dart';

class AddCubit extends Cubit<AddState>{

  RepositoryClass repositoryObject;

  AddCubit(this.repositoryObject) : super(LoadingAddState());


  void addEmployee(String firstName , String lastName){

    emit(LoadingAddState());
    Future<EmployeeModel> employee = repositoryObject.registerEmployeesToCubit(firstName.toString(),lastName.toString());
    var timer = Timer(const Duration(seconds: 3), () => emit(SuccessAddState(employee)));

  }

}