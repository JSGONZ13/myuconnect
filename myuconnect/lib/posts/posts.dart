import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myuconnect/Models/post.dart';
import 'package:myuconnect/Posts/create_posts.dart';
import 'package:myuconnect/responses/presentation/pages/responses_page.dart';

class Posts extends StatefulWidget {
  final String nickname;
  const Posts({Key? key, required this.nickname}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff003F72)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreatePosts(
                                  nickname: widget.nickname,
                                )));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Text(
                      "Publicar",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                  )),
            ),
          ),
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
                            return UPost(
                              psts: psts,
                              nickName: widget.nickname,
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

class UPost extends StatelessWidget {
  const UPost({Key? key, required this.psts, required this.nickName})
      : super(key: key);

  final QueryDocumentSnapshot<Object?> psts;
  final String nickName;

  @override
  Widget build(BuildContext context) {
    Post post = Post(psts.id, psts['titulo'], psts['body'],
        psts['nicknameUsuario'], psts['date']);
    return Container(
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
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Publicado por " + post.nicknameUsuario,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300, fontSize: 16),
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
                          "Ver publicación",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: const Color(0xff003F72)),
                        ),
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
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
