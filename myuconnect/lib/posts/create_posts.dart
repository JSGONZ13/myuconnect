import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myuconnect/Models/post.dart';

class CreatePosts extends StatefulWidget {
  final String nickname;
  CreatePosts({Key? key, required this.nickname}) : super(key: key);

  @override
  _CreatePostsState createState() => _CreatePostsState();
}

class _CreatePostsState extends State<CreatePosts> {
  final firebase = FirebaseFirestore.instance;

  Post post = Post("", "", "", "", DateTime.now().toString());
  create(Post post) async {
    try {
      await firebase.collection("posts").doc(post.id).collection("responses").doc().set({
        "titulo": post.titulo,
        "body": post.body,
        "nicknameUsuario": post.nicknameUsuario,
        "date": post.date,
      });
    } catch (e) {
      print(e);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController tituloController = TextEditingController();
    TextEditingController bodyController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffffffff),
        foregroundColor: const Color(0xff003F72),
        title: Text(
          "Publicar nueva entrada",
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                  color: Color(0x1A003F72), spreadRadius: 1, blurRadius: 25),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          height: 500,
          width: 500,
          padding: const EdgeInsets.all(20),
          child: ListView(children: [
            Container(
              width: 250,
              height: 120,
              padding: const EdgeInsets.all(10),
              child: TextField(
                autocorrect: false,
                enableSuggestions: false,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: "Título del post:",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: tituloController,
              ),
            ),
            Container(
              width: 250,
              height: 300,
              padding: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                autocorrect: false,
                enableSuggestions: false,
                decoration: InputDecoration(
                  labelText: "Contenido:",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: bodyController,
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff003F72)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))),
          onPressed: () {
            print(tituloController.text);
            setState(() {
              post = Post("", tituloController.text, bodyController.text,
                  widget.nickname, DateTime.now().toString());
            });
            create(post);
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              "Publicar",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400, fontSize: 20),
            ),
          )),
    );
  }
}
