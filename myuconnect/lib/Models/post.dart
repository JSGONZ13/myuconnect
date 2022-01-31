import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Post {
  String _id = "", _titulo = "", _body = "", _nicknameUsuario = "";

  Post(this._id, this._titulo, this._body, this._nicknameUsuario);

  Post.map(dynamic object) {
    _titulo = object['titulo'];
    _body = object['body'];
    _nicknameUsuario = object['nicknameUsuario'];
  }

  String get id => _id;
  String get titulo => _titulo;
  String get body => _body;
  String get nicknameUsuario => _nicknameUsuario;

  
}
