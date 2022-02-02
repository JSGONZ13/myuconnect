
// ignore_for_file: unused_local_variable


import 'package:myuconnect/responses/features/data/remote/data_sources/firebase_remote_data_source.dart';
import 'package:myuconnect/responses/features/data/remote/models/comments_model.dart';
import 'package:myuconnect/responses/features/domain/entities/comments_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseRemoteDataSourceIml implements FireBaseRemoteDataSource {
  final FirebaseFirestore firestore;

  FireBaseRemoteDataSourceIml(this.firestore);

  @override
  Stream<List<TextCommentsEntity>> getComments(String refPost) {
    final commentsCollection = firestore.collection(refPost);
    return commentsCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => CommentsModel.fromSnapshot(e)).toList());
  }

  @override
  Future<void> sendComments(TextCommentsEntity textCommentsEntity, String refPost) async {
    //final CommentsModel commentsModel;
    final commentsCollection = firestore.collection(refPost);
    final commentId = commentsCollection.doc().id;
    final newComment = CommentsModel(
      contenido: textCommentsEntity.contenido,
      horaEnvio: textCommentsEntity.horaEnvio,
      nickName: textCommentsEntity.nickName,
      tituloPost: textCommentsEntity.tituloPost
    ).toDocument();

    commentsCollection.doc(commentId).set(newComment);
  }
  
}