// ignore_for_file: prefer_const_constructors, duplicate_ignore, use_key_in_widget_constructors, unnecessary_new, unused_label

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myuconnect/UI/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myuconnect/on_generate_route.dart';

import 'package:myuconnect/responses/features/domain/entities/comments_entity.dart';
import 'package:myuconnect/responses/features/domain/repositories/firebase_repository.dart';
import 'package:myuconnect/responses/features/domain/usecases/get_comments_useCase.dart';

import 'package:myuconnect/responses/features/presentation/cubit/cubit_chat/cubit_comments.dart';
import 'package:myuconnect/responses/features/presentation/pages/comments_page.dart';
import 'UI/dashboard.dart';
import 'injection_container.dart' as di;


Future<void> main()  async {
  GetIt get = GetIt.instance;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final entity = TextCommentsEntity(contenido: "contenido post", horaEnvio: Timestamp.now(), nickName: "jesarmiento3", tituloPost: "titulo del post");
    return MultiBlocProvider(
      providers: [
        BlocProvider<CommentsCubit>(create: (_) => di.sl<CommentsCubit>()),
      ],  
      child: MaterialApp(
        title: "holña",
        routes: {
          "/": (context) {
            return CommentsPage(textCommentsEntity: entity);
          }
        },
      )
    );
  }
}



