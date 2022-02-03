

// ignore_for_file: must_be_immutable



import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';


Responses gameFromMap(String str) => Responses.fromMap(json.decode(str));

String repoToMap(Responses data) => json.encode(data.toMap());

class Responses {
  Responses({
    this.id,
    required this.namePost,
    required this.content,
    required this.date,
    required this.nickName
  });

  final String? id;
  final String namePost;
  final String content;
  final String date;
  final String nickName;

  factory Responses.fromMap(Map<String, dynamic> json) => Responses(
        namePost: json['namePost'],
        content: json['content'],
        date: json['date'],
        nickName: json['nickName']
      );

  Map<String, dynamic> toMap() => {
        'namePost': namePost,
        'content': content,
        'date': date,
        'nickName': nickName
      };




}