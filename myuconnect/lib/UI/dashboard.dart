import 'package:flutter/material.dart';
import 'package:myuconnect/Models/users.dart';
import 'package:myuconnect/services/apiService.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  
  final List<User>? users;

  final String email;
   Dashboard({ Key? key,  required this.email, required this.users }) : super(key: key);

   UserService userService = UserService();

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "flutter"
        ),
      ),
      body: ListView.builder(
        itemCount: users == null ? 0 : users!.length ,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(users![index].nombre.toString()),
              subtitle: Text(users![index].apellido.toString()),
            ),
          );
        },
      ),
    );
  }
}