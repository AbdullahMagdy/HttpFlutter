import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lets_connect/Repositories/repository.dart';
import 'package:lets_connect/Screens/deleteEmployee.dart';
import 'package:lets_connect/Screens/view.dart';
import 'package:lets_connect/controllers/delete_cubit.dart';
import 'package:lets_connect/controllers/get_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/employee_model.dart';
import 'employeeDrawer.dart';

class GetEmployees extends StatefulWidget {
  const GetEmployees({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GetAllEmployeesState();
  }
}

class GetAllEmployeesState extends State<GetEmployees> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(
        title: const Text("All Employees Details"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => employeeDrawer()));
          },
        ),

      ),
      body: Container(
        child: FutureBuilder(
          future: BlocProvider.of<GetCubit>(context).getEmployees(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: Icon(Icons.error));
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.account_circle),
                          title: Text(snapshot.data[index].firstName ?? ''),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                                child: const Text('View Details'),
                                onPressed: () =>

                                    Navigator.pushNamed(
                                        context,
                                        ExtractArgumentsScreen.routeName,
                                        arguments: snapshot.data[index]
                                    )

                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('Delete'),
                              style: TextButton.styleFrom(
                                primary: Colors.red[700],
                              ),
                              onPressed: () {
                                BlocProvider.of<DeleteCubit>(context).deleteEmployee(
                                   snapshot.data[index].id
                                    );
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),


                      ],
                    ),
                  );
                });
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(

        onPressed: () {
          //Navigator.pushNamed(context, "/addEmployee");
          Navigator.pushReplacementNamed(context,'/addEmployee');

        },
        tooltip: 'Add New Employee',
        child: const Icon(Icons.add),

      ),
    );
  }
}

//
// class DetailPage extends StatelessWidget {
//   EmployeeModel employee;
//
//   DetailPage(this.employee);
//
//   deleteEmployee1(EmployeeModel employee) async {
//     final url = Uri.parse('http://localhost:8080/employees');
//     final request = http.Request("DELETE", url);
//     request.headers
//         .addAll(<String, String>{"Content-type": "application/json"});
//     request.body = jsonEncode(employee);
//     final response = await request.send();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(employee.firstName.toString()),
//         actions: <Widget>[
//           IconButton(
//               icon: const Icon(
//                 Icons.edit,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//
//
//                 // Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //         builder: (context) => updateEmployee(employee)));
//               })
//         ],
//       ),
//       body: Container(
//         child: Text('FirstName' +
//             ' ' +
//             employee.firstName.toString() +
//             ' ' +
//             'LastName' +
//             employee.lastName.toString()),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // deleteEmployee1(employee);
//           // Navigator.push(context,
//           //     MaterialPageRoute(builder: (context) => deleteEmployee()));
//         },
//         child: Icon(Icons.delete),
//         backgroundColor: Colors.pink,
//       ),
//     );
//   }
// }
