import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApi {
  static String url = 'socialpputpl.herokuapp.com/socialApi/';
  static verifyUser(String nickname, String pass) async {
    String request = nickname + "&" + pass;
    http.Response response = await http.get(Uri.parse(url + 'users'));

    try {
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        print(body);
        return response;
      } else {
        print('failed connection');
        return 'failed';
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }
}
