// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myuconnect/Models/user.dart';
import 'package:myuconnect/services/apiService.dart';

import '../main_dashboard.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  final String email;
  Dashboard({Key? key, required this.email}) : super(key: key);

  UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          return Center(
            child: SizedBox(
              width: 400.0,
              child: ListView.builder(
                  shrinkWrap: true,
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
                    return Container(
                      margin: EdgeInsets.all(40),
                      child: Center(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 40),
                              child: Center(
                                child: Text(
                                    "Bienvenido " + users.nickname.toString(),
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 23)),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(0),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xff003F72)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainDashboard(
                                                nickname:
                                                    users.nickname.toString(),
                                              )));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "EMPEZAR",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 1),
            ),
          );
        } else {
          return Text("data");
        }
      },
    ));
  }
}
