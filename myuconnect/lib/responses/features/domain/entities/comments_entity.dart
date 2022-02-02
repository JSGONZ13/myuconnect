// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TextCommentsEntity extends Equatable {

  final String? contenido;
  final String? nickName;
  final String? tituloPost;
  final Timestamp? horaEnvio;

  TextCommentsEntity({
    this.contenido,
    this.nickName,
    this.tituloPost,
    this.horaEnvio
  });

  @override
  List<Object?> get props => [
    contenido!,
    nickName!,
    tituloPost!,
    horaEnvio!
  ];
  
}