import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myuconnect/responses/features/domain/entities/comments_entity.dart';
import 'package:myuconnect/responses/features/presentation/cubit/cubit_chat/cubit_comments.dart';

class CommentsPage extends StatefulWidget {
  final TextCommentsEntity textCommentsEntity;
  const CommentsPage({ Key? key, required this.textCommentsEntity }) : super(key: key);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {

  @override
  void initState() {
    BlocProvider.of<CommentsCubit>(context).getComments(refPost: widget.textCommentsEntity.tituloPost.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comentarios"),
      ),
      body: BlocBuilder<CommentsCubit, CommentState>(
        builder: (index, chatState) {
          return RaisedButton(
            onPressed: () {
              BlocProvider.of<CommentsCubit>(context).sendComments(
                textCommentsEntity: TextCommentsEntity(
                  contenido: "contenido firebase",
                  horaEnvio: Timestamp.now(),
                  nickName: "jesarmiento3 fire",
                  tituloPost: "titulo firebase"
                ), 
                refPost: "refPost");
            },
          );
        }
        
        )
    );
  }
}