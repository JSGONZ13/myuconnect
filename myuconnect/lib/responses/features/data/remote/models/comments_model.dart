import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myuconnect/responses/features/domain/entities/comments_entity.dart';

class CommentsModel extends TextCommentsEntity {
  CommentsModel({
    String? contenido,
    String? nickName,
    String? tituloPost,
    Timestamp? horaEnvio,
  }):super (
    contenido: contenido,
    horaEnvio: horaEnvio,
    nickName: nickName,
    tituloPost: tituloPost
  );

  factory CommentsModel.fromSnapshot(DocumentSnapshot snapshot) {
    return CommentsModel(
      contenido: snapshot.get('contenido'),
      nickName: snapshot.get('nickName'),
      tituloPost: snapshot.get('tituloPost'),
      horaEnvio: snapshot.get('horaEnvio'),
    );
  }

  Map<String, dynamic> toDocument () {
    return {
      'contenido': contenido,
      'nickName': nickName,
      'tituloPost': tituloPost,
      'horaEnvio': horaEnvio,
    };
  }
}