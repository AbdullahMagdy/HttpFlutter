
import 'package:lets_connect/Model/employee_model.dart';

abstract class GetState{

}

class SuccessGetState extends GetState{

  List<EmployeeModel> list ;
  SuccessGetState(this.list);

}

class LoadingGetState extends GetState{

}