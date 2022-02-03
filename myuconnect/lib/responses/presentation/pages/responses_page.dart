// ignore_for_file: prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myuconnect/Models/post.dart';
import 'package:myuconnect/responses/data/models/response_model.dart';
import 'package:myuconnect/responses/presentation/provider/responses_provider.dart';
import 'package:provider/provider.dart';

class ResponsesPage extends StatefulWidget {
  final Post post;
  final String nickName;
  const ResponsesPage({Key? key, required this.post, required this.nickName})
      : super(key: key);

  @override
  _ResponsesPageState createState() => _ResponsesPageState();
}

class _ResponsesPageState extends State<ResponsesPage> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController _textResponse = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var res = context.watch<ResponsesProvider>();
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffffffff),
          foregroundColor: const Color(0xff003F72),
          title: Text(
            widget.post.titulo,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
        body: Row(
          children: [
            Flexible(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: myPost(),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _textResponse,
                          maxLines: null,
                          validator: (value) {
                            if (value!.isEmpty) {
                              print("por favor coloque data");
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: const Text("Enviar"),
                          onPressed: () {
                            if (_textResponse.text.isEmpty) {
                              print("Ingrese data");
                            } else {
                              res.sendResponses(
                                  Responses(
                                      namePost: widget.post.titulo,
                                      content: _textResponse.text,
                                      date: DateTime.now().toString(),
                                      nickName: widget.nickName),
                                  widget.post.id);
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Flexible(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 504,
                        width: double.infinity,
                        margin: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          physics: const ScrollPhysics(),
                          child: StreamBuilder<QuerySnapshot>(
                            stream: db
                                .collection("posts")
                                .doc(widget.post.id)
                                .collection("responses")
                                .orderBy("date", descending: true)
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    QueryDocumentSnapshot resp =
                                        snapshot.data!.docs[index];

                                    return UResponses(
                                      resp: resp,
                                      nick: widget.nickName,
                                      idDocument: widget.post.id,
                                    );
                                  },
                                );
                              } else {
                                return const SizedBox(
                                    width: 40,
                                    child: Center(
                                        child: CircularProgressIndicator()));
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  Card myPost() {
    return Card(
      color: const Color(0xfff2f2f2),
      child: Expanded(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    widget.post.titulo,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Publicado por: " + widget.post.nicknameUsuario,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300, fontSize: 16),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    widget.post.body,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UResponses extends StatelessWidget {
  const UResponses(
      {Key? key,
      required this.resp,
      required this.nick,
      required this.idDocument})
      : super(key: key);

  final QueryDocumentSnapshot<Object?> resp;
  final String nick;
  final String idDocument;

  @override
  Widget build(BuildContext context) {
    var res = context.watch<ResponsesProvider>();
    Responses responses = Responses(
        id: resp.id,
        namePost: resp['namePost'],
        content: resp['content'],
        date: resp['date'],
        nickName: nick);
    return Container(
      child: Card(
        color: const Color(0xfff2f2f2),
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text("Fecha de Respuesta: " + responses.date),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text(responses.content),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text("Respuesta de: " + resp['nickName']),
              ),
              if (nick == resp['nickName'])
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        mini: true,
                        onPressed: () {
                          res.deleteResponse(
                              responses, idDocument, responses.id);
                        },
                        child: Icon(Icons.delete_forever),
                      ),
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
