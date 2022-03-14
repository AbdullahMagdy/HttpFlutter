
import 'dart:async';

import 'package:lets_connect/Repositories/repository.dart';
import 'package:lets_connect/states/AddState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/employee_model.dart';
import '../states/DeleteState.dart';

class DeleteCubit extends Cubit<DeleteState>{

  RepositoryClass repositoryObject;

  DeleteCubit(this.repositoryObject) : super(LoadingDeleteState());


  void deleteEmployee(int id){

    emit(LoadingDeleteState());
    Future<String> employee = repositoryObject.deleteEmployees(id);
    var timer = Timer(const Duration(seconds: 3), () => emit(SuccessDeleteState()));

  }

}