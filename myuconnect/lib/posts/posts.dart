import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Posts extends StatefulWidget {
  final String nickname;
  const Posts({Key? key, required this.nickname}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final firebase = FirebaseFirestore.instance;
  create() async {
    try {
      await firebase.collection("posts").doc().set({
        "titulo": "Problemas con servidores",
        "body":
            "Los servidores de la universidad tienen problemas para subir las tareas",
        "nicknameUsuario": widget.nickname,
        "date": DateTime.now().toString(),
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff003F72)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)))),
                onPressed: create,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    "Publicar",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                )),
          ),
          Center(
            child: Container(
              height: 400,
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: StreamBuilder<QuerySnapshot>(
                  stream: firebase.collection("posts").orderBy("date", descending: true).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, i) {
                            QueryDocumentSnapshot psts = snapshot.data!.docs[i];
                            return Post(psts: psts);
                          });
                    } else {
                      return const SizedBox(
                          width: 40,
                          child: Center(child: CircularProgressIndicator()));
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    Key? key,
    required this.psts,
  }) : super(key: key);

  final QueryDocumentSnapshot<Object?> psts;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Card(
          color: const Color(0xfff2f2f2),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  psts['titulo'],
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Text(
                  "Publicado por " + psts['nicknameUsuario'],
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w300, fontSize: 16),
                ),
                Text(
                  "Fecha: " + psts['date'],
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w300, fontSize: 14),
                ),
              ],
            ),
          )),
    );
  }
}
