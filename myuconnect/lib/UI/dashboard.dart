// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myuconnect/Models/user.dart';
import 'package:myuconnect/Models/users.dart';
import 'package:myuconnect/services/apiService.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {

  final String email;
   Dashboard({ Key? key,  required this.email}) : super(key: key);

   UserService userService = UserService();
  List<User>? user;
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Posts"
        ),
      ),
      body: FutureBuilder <List<UserModel>>(
        future: userService.getUsersByEmail(email),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator()
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString()
              ),
            );
          } else if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: <Widget> [
                      Text(
                        '${snapshot.data![index].nombre}'
                      ),
                      Text(
                        '${snapshot.data![index].apellido}'
                      ),
                      Text(
                        '${snapshot.data![index].email}'
                      ),
                      Text(
                        '${snapshot.data![index].universidad}'
                      ),
                    ],
                  ),
                );
              },
              itemCount: 1
            );
          } else {
            return Text("data");
          }
        },
      )
    );
  }
}