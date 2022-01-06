// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:myuconnect/Models/user.dart';
import 'package:myuconnect/Models/users.dart';
import 'package:myuconnect/services/apiService.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  final String email;
  Dashboard({Key? key, required this.email}) : super(key: key);

  UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
        ),
        body: FutureBuilder<List<UserModel>>(
          future: userService.getUsersByEmail(email),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    UserModel users = UserModel(
                        nombre: snapshot.data![0].nombre,
                        apellido: snapshot.data![0].apellido,
                        cedula: snapshot.data![0].cedula,
                        telefono: snapshot.data![0].telefono,
                        email: email,
                        password: snapshot.data![0].password,
                        nickname: snapshot.data![0].nickname,
                        universidad: snapshot.data![0].universidad,
                        carrera: snapshot.data![0].carrera,
                        cargo: snapshot.data![0].cargo);
                    print(users.nickname);
                    return Center(
                        child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Nombre: \n' + users.nombre.toString(),
                        ),
                    ));
                  },
                  itemCount: 1);
            } else {
              return Text("data");
            }
          },
        ));
  }
}
