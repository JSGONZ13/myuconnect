import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:myuconnect/UI/dashboard.dart';
import 'package:myuconnect/services/apiService.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  bool secretPass = true;

  final UserService userService = UserService();

  Future save() async {
    var res = await http.post(
        Uri.parse("https://myuconnect.herokuapp.com/signin"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'email': emailController.text,
          'password': passController.text
        });
    if (res.body.isEmpty) {
      debugPrint('Datos incorrectos');
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Dashboard(
                    email: emailController.text,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffffffff),
        foregroundColor: Color(0xff003F72),
      ),
      body: Center(
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                    color: Color(0x1A003F72), spreadRadius: 1, blurRadius: 25),
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            height: 400,
            width: 300,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Ingrese sus credenciales de acceso:",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                ),
                Container(
                  width: 250,
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
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
                  padding: const EdgeInsets.all(10),
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
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(top: 60),
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff003F72)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "INGRESAR",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                    ),
                    onPressed: () {
                      if (emailController.text == '' &&
                          passController.text == '') {
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
      )
    );
  }

  
}


