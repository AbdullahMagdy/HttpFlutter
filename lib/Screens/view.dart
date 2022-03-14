// A Widget that extracts the necessary arguments from
// the ModalRoute.
import 'package:flutter/material.dart';
import 'package:lets_connect/Model/employee_model.dart';

class ExtractArgumentsScreen extends StatelessWidget {

  const ExtractArgumentsScreen({Key? key}) : super(key: key);

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context)!.settings.arguments as EmployeeModel;

    return AlertDialog(
      title:
      const Text('Employee Details : '),
      content: Text('Employee Id     : ' +
          args.id.toString() +
          '\n'
              'Employee Name   : ' +
          args.firstName.toString()  +
          '\n'
              'Employee Salary : ' +
          args.lastName.toString() ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(
              context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () =>
              Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}