import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myuconnect/responses/features/presentation/pages/comments_page.dart';

import 'responses/features/domain/entities/comments_entity.dart';


class OnGenerateRoute {
  
  static Route<dynamic> route (RouteSettings settings) {
    final entity = TextCommentsEntity(contenido: "contenido post", horaEnvio: Timestamp.now(), nickName: "jesarmiento3", tituloPost: "titulo del post");
    final args = settings.arguments;

    switch(settings.name) {
      case ("CommentsPage") :
        if (args is String) {
          return materialBuilder(
            widget: CommentsPage(textCommentsEntity: entity,)
          );
        } else {
          return materialBuilder(widget: ErrorPage() );
        }
        break;
        default:
        return materialBuilder(
          widget: ErrorPage(),
        );
    }
    
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("error"),
      ),
      body: Center(
        child: Text("error"),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}