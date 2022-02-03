import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myuconnect/Models/post.dart';

class UpdatePosts extends StatefulWidget {
  final Post post;
  final String nick;
   UpdatePosts({ Key? key, required this.post, required this.nick}) : super(key: key);

  @override
  _UpdatePostsState createState() => _UpdatePostsState();
}

class _UpdatePostsState extends State<UpdatePosts> {

  final FirebaseFirestore db = FirebaseFirestore.instance;
  Post post = Post("", "", "", "", DateTime.now().toString());

  TextEditingController _textTitle = TextEditingController();
  TextEditingController _textBody = TextEditingController();

  @override
  void initState() {
    _textTitle = TextEditingController(text: widget.post.titulo);
    _textBody = TextEditingController(text: widget.post.body);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffffffff),
        foregroundColor: const Color(0xff003F72),
        title: Text(
          widget.post.titulo,
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
                controller: _textTitle,
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
                controller: _textBody,
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
            setState(() {
              post = Post("", _textTitle.text, _textBody.text,
                  widget.nick, DateTime.now().toString());
            });
            update(post, widget.post.id);
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              "Actualizar",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400, fontSize: 20),
            ),
          )),
    );
  }
  
void update (Post post, String idDocument) async{
  post = Post("", _textTitle.text, _textBody.text, widget.nick, DateTime.now().toString());

  await db.collection("posts").doc(idDocument).set(
    post.toMap(), SetOptions(merge: true)
  );
}

}
