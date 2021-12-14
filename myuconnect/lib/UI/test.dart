import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myuconnect/Models/users.dart';
import 'package:myuconnect/UI/dashboard.dart';
import 'package:myuconnect/services/apiService.dart';
import 'package:myuconnect/Models/user.dart';

class Test extends StatefulWidget {
  const Test({ Key? key }) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  final UserService userService = UserService();
  //List<User>? userList;
  var users = <User, dynamic>{};
  //var users1 = <UserModel>[];

/*
  _getUser () {
    userService.getUsers1().then((response) {
      setState(() {
        Map<dynamic, dynamic> data = (json.decode(response.body));
        //users = data.map((key, value) => User.fromJson(key, value));
        users = data.map((key, value) => MapEntry(key, value));
      });
    });
  }
  */
  /*
  _getUser1 () {
    userService.getUsers1().then((value) {
      setState(() {
        List <String> data = json.decode(value.body);
        users1 = data.map((e) => UserModel.fromJson(e as Map<dynamic, dynamic>)).toList();
        //users1 = data.map((e) => User.fromJson(e)).toList();
      });
    });
  }
  */

  @override
  void initState() {
    super.initState();
    //_getUser();
    //_getUser1();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_conditional_assignment, unnecessary_null_comparison
   
    return Scaffold(
      body:  FutureBuilder <List<UserModel>>(
        future: userService.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: <Widget> [
                      Text(snapshot.data![index].nombre.toString()),
                      Text(snapshot.data![index].apellido.toString())
                    ],
                  ),
                );
              },
              itemCount: snapshot.data!.length
            );
          } else {
            return Text("data");
          }
        },
      )
    );
  }

  
}