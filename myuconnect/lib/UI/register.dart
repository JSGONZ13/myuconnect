// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:myuconnect/UI/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController cedulaController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController universidadController = TextEditingController();
  TextEditingController carreraController = TextEditingController();
  TextEditingController cargoController = TextEditingController();

  bool secretPass = true;

  Future save() async {
    var res = await http.post(Uri.parse("https://myuconnect.herokuapp.com/signup"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'nombre': nombreController.text,
          'apellido': apellidoController.text,
          'cedula': cedulaController.text,
          'telefono': telefonoController.text,
          'email': emailController.text,
          'password': passController.text,
          'nickName': nicknameController.text,
          'universidad': universidadController.text,
          'carrera': carreraController.text,
          'cargo': cargoController.text.toLowerCase(),
        });
    print(res.body);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffffffff),
          foregroundColor: Color(0xff003F72),
          title: Text(
            "Registrarse:",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                BoxShadow(
                    color: Color(0x1A003F72), spreadRadius: 1, blurRadius: 25),
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            height: 500,
            width: 500,
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                Container(
                  width: 250,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "Nombres:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: nombreController,
                  ),
                ),
                Container(
                  width: 250,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "Apellidos:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: apellidoController,
                  ),
                ),
                Container(
                  width: 250,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "Cédula:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: cedulaController,
                  ),
                ),
                Container(
                  width: 250,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "Teléfono:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: telefonoController,
                  ),
                ),
                Container(
                  width: 250,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: emailController,
                  ),
                ),
                Container(
                  width: 250,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: secretPass,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          !secretPass ? Icons.visibility_off : Icons.visibility,
                          size: 17,
                        ),
                        onPressed: () {
                          setState(() {
                            secretPass = !secretPass;
                          });
                        },
                      ),
                      labelText: "Contraseña",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: passController,
                  ),
                ),
                Container(
                  width: 250,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "NickName:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: nicknameController,
                  ),
                ),
                Container(
                  width: 250,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "Universidad:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: universidadController,
                  ),
                ),
                Container(
                  width: 250,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "Carrera:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: carreraController,
                  ),
                ),
                Container(
                  width: 250,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "Estudiante o Docente:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: cargoController,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(top: 60),
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff003F72)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Registrarse",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                    ),
                    onPressed: () {
                      if (nombreController.text.isEmpty ||
                          apellidoController.text.isEmpty ||
                          cedulaController.text.isEmpty ||
                          telefonoController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          passController.text.isEmpty ||
                          nicknameController.text.isEmpty ||
                          universidadController.text.isEmpty ||
                          carreraController.text.isEmpty ||
                          cargoController.text.isEmpty) {
                        debugPrint('Campos vacíos');
                      } else {
                        save();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
