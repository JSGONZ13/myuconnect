import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myuconnect/responses/data/models/res.dart';

class ResModel extends Res {
  ResModel({
   final String? contenido
  }) :super (contenido: contenido);

  factory ResModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return ResModel(contenido: documentSnapshot.get('contenido'));
  }

  Map<String, dynamic> toDocument () {
    return {
      'content': contenido
    };
  }
}