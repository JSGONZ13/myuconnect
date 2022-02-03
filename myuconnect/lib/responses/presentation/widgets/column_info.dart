// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myuconnect/responses/data/models/response_model.dart';
import 'package:myuconnect/responses/presentation/provider/responses_provider.dart';
import 'package:provider/src/provider.dart';

class ColumnInfo extends StatelessWidget {
  final String titlePost, contentPost, nickNamePost, contenido, idDocument;
   ColumnInfo(this.titlePost, this.contentPost, this.nickNamePost, this.contenido, this.idDocument);


  @override
  Widget build(BuildContext context) {
    var responses = context.watch<ResponsesProvider>();
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          titlePost
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          contentPost
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          nickNamePost
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            
            
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text("Enviar"),
                onPressed: () {
                  
                  responses.getResponses(titlePost);
                },
              ),
            )
          ],
        )
      ],
    );
    
  }

  
}