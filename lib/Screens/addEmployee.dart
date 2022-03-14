import 'dart:convert';
import 'package:lets_connect/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lets_connect/Repositories/repository.dart';
import 'package:lets_connect/controllers/add_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Model/employee_model.dart';
import '../states/AddState.dart';

class registerEmployee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return registerEmployeeState();
  }
}



class registerEmployeeState extends State<registerEmployee> {

  final minimumPadding = 5.0;

  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();


  late EmployeeModel employee;
  late AddCubit addCubit;

  @override
  void initState() {
    super.initState();
    addCubit=getIt<AddCubit>();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Employee"),
      ),
      body: BlocListener<AddCubit,AddState>(

        listener: (context, state) {
          if (state is SuccessAddState) {
            print("success");
            Navigator.pushReplacementNamed(context, '/list');
          }
          if (state is LoadingAddState) {
            print("loading");
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Loading ... ')));
          }
        },
        child: Form(

        child: Padding(
          padding: EdgeInsets.all(minimumPadding * 2),
          child: ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(

                    style: textStyle,
                    controller: firstController,
                    decoration: InputDecoration(
                        labelText: 'First Name',
                        hintText: 'Enter Your First Name',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: lastController,

                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        hintText: 'Enter Your First Name',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () async {
                    String firstName = firstController.text;
                    String lastName = lastController.text;

                    // EmployeeModel employees =
                    // await RepositoryClass().registerEmployees(firstName, lastName, context);
                    // firstController.text = '';
                    // lastController.text = '';
                    // setState(() {
                    //   employee = employees;
                    // });


                   addCubit.addEmployee(
                        firstName,
                        lastName);


                  })
            ],
          ),
        ),
      ),
    )
    );
  }
}

class MyAlertDialog extends StatelessWidget {

  final String title;
  final String content;
  final List<Widget> actions;

   MyAlertDialog({
    required this.title,
    required this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        //style: Theme.of(context).textTheme.title,
      ),
      //actions: actions,
      content: const Text("New Employee Added"
        //content,
        //style: Theme.of(context).textTheme.body1,
      ),
    );
  }
}
