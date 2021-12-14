import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:myuconnect/Models/user.dart';
import 'package:myuconnect/Models/users.dart';
import 'package:http/http.dart' as http;

class UserService {
  var url = ("carbonoapp.herokuapp.com");
  final apiUrl = Uri.parse("https://myuconnect.herokuapp.com/get");
/*
  Future<List<User>> getUsers() async {
    Response res = await get(apiUrl);
    if (res.statusCode == 200) {
      List<dynamic> body  = jsonDecode(res.body);
      List<User> users = body.map((dynamic item) => User.fromJson(item)).toList();
      return users;
    } else {
      throw "Error al cargar la lista";
    }
  }
  */
/*
   Future <User> getUsersByEmail(String email) async {
    // ignore: unused_local_variable, unnecessary_cast
    Response res =
        await get(Uri.https("myuconnect.herokuapp.com", '/getUser/$email'));
    if (res.statusCode == 200) {
      return User.fromJson(json.decode(res.body));
    } else {
      throw Exception("Falló nuevo usuario");
    }
  }
  */

  Future getUsers1() {
    var url = Uri.parse("https://myuconnect.herokuapp.com/get");
    return http.get(url);
  }

  Future <List<UserModel>> getAllUsers() async {
    Response res = await get(apiUrl);
    final dataUser = json.decode(res.body)['user'] as List;
    return dataUser.map((e) => UserModel.fromJson(e)).toList();
  }
}