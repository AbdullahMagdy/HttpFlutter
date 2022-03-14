import 'package:flutter/material.dart';
import 'package:lets_connect/Repositories/repository.dart';
import 'package:lets_connect/Screens/addEmployee.dart';
import 'package:lets_connect/Screens/getEmployees.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_connect/controllers/delete_cubit.dart';
import 'package:lets_connect/controllers/get_cubit.dart';
import 'package:lets_connect/controllers/add_cubit.dart';
import 'Screens/employeeDrawer.dart';
import 'Screens/view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

GetIt getIt = GetIt.I;

void main() {
  getIt.registerSingleton<RepositoryClass>(RepositoryClass(),
      signalsReady: true);
  getIt.registerSingleton<AddCubit>(AddCubit(getIt()),
      signalsReady: true);
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AddCubit>(
            create: (context) => getIt<AddCubit>(),
          ),

          BlocProvider<GetCubit>(
            create: (context) => GetCubit(getIt()),
          ),

          BlocProvider<DeleteCubit>(
            create: (context) => DeleteCubit(getIt()),
          ),
        ],
        child: Provider(
        create: (context) => RepositoryClass(),
    child:


    MaterialApp(
      title: 'EmployeeManagement',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello In Employee Management System'),
        ),
        body: employeeDrawer(),
      ),

      routes: {

        '/home' :(context) => employeeDrawer(),
        '/addEmployee' :(context) => registerEmployee(),
        '/list' :(context) => const GetEmployees(),

        ExtractArgumentsScreen.routeName: (context) =>
        const ExtractArgumentsScreen(),
      },

      initialRoute: '/home'
    )
    )
    );
  }
}
