import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myuconnect/Models/post.dart';
import 'package:myuconnect/MyPosts/update_posts.dart';
import 'package:myuconnect/posts/view_posts.dart';
import 'package:myuconnect/responses/presentation/pages/responses_page.dart';

class MyPosts extends StatefulWidget {
  String nickName;
  MyPosts({Key? key, required this.nickName}) : super(key: key);

  @override
  _MyPostsState createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  final firebase = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 504,
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: StreamBuilder<QuerySnapshot>(
                  stream: firebase
                      .collection("posts")
                      .orderBy("date", descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, i) {
                            QueryDocumentSnapshot psts = snapshot.data!.docs[i];
                            return MyPost(
                              psts: psts,
                              nickName: widget.nickName,
                            );
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

class MyPost extends StatelessWidget {
  const MyPost({Key? key, required this.psts, required this.nickName})
      : super(key: key);

  final QueryDocumentSnapshot<Object?> psts;
  final String nickName;

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    Post post = Post(psts.id, psts['titulo'], psts['body'],
        psts['nicknameUsuario'], psts['date']);

    void _showAlertDialogSi(BuildContext context) {
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                
                content: Text('Elija la opci??n que desee realizar',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: const Color(0xff191919))),
                actions: <Widget>[
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: () {
                            print(post);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResponsesPage(
                                          post: post,
                                          nickName: nickName,
                                        )));
                          },
                          child: Text('Ver publicaci??n',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: const Color(0xff003F72))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UpdatePosts(post: post, nick: nickName),
                              )),
                          child: Text('Editar publicaci??n',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: const Color(0xff003F72))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: () async {
                            await db.collection("posts").doc(post.id).delete();
                          },
                          child: Text('Eliminar publicaci??n',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: const Color(0xff003F72))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () => Navigator.pop(context, "Salir"),
                          child: Text('Salir',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Colors.redAccent)),
                        ),
                      ),
                    ],
                  )
                ],
              ));
    }

    return Column(
      children: [
        if (nickName == psts['nicknameUsuario'])
          Container(
            margin: const EdgeInsets.all(5),
            child: Card(
              color: const Color(0xfff2f2f2),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          post.titulo,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Fecha: " + post.date,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w300, fontSize: 14),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: const EdgeInsets.all(6),
                          child: TextButton(
                            child: Text(
                              "Opciones",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: const Color(0xff003F72)),
                            ),
                            onPressed: () {
                              _showAlertDialogSi(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
