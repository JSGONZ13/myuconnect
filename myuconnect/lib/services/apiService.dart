// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:myuconnect/Models/user.dart';
import 'package:myuconnect/Models/users.dart';
import 'package:http/http.dart' as http;

class UserService {
  var url = ("carbonoapp.herokuapp.com");
  final apiUrl = Uri.parse("https://myuconnect.herokuapp.com/get");

  Future <List<UserModel>> getAllUsers() async {
    Response res = await get(apiUrl);
    final dataUser = json.decode(res.body)['user'] as List;
    return dataUser.map((e) => UserModel.fromJson(e)).toList();
  }

  Future <List<UserModel>> getUsersByEmail(String email) async {

    Response res =
        await get(Uri.https("myuconnect.herokuapp.com", '/getUser/$email'));
    if (res.statusCode == 200) {
      final dataUser = (json.decode(res.body)['user'] as List).map((e) => UserModel.fromJson(e)).toList();
      return dataUser;
    } else {
      throw Exception("Falló nuevo usuario");
    }
  }

}