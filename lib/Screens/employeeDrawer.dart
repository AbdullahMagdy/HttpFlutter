
import 'package:flutter/material.dart';
import 'package:lets_connect/Repositories/repository.dart';
import 'addEmployee.dart';
import 'getEmployees.dart';

class employeeDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return employeeDrawerState();
  }
}

class employeeDrawerState extends State<employeeDrawer> {
  final minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Management'),
      ),
      body: const Center(child: Text('Welcome To PXP Channel')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
          children: <Widget>[
            const DrawerHeader(
              child: Text('Employee Management'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('Register Employee'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => registerEmployee())
                );
              },
            ),
            ListTile(
              title: const Text('Get Employees'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GetEmployees()));
              },
            )
          ],
        ),
      ),
    );
  }
}
