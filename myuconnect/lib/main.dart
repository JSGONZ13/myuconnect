// ignore_for_file: prefer_const_constructors, duplicate_ignore, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myuconnect/UI/dashboard.dart';
import 'package:myuconnect/UI/wrapper.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:myuconnect/responses/di/injector.dart';
import 'package:myuconnect/responses/presentation/provider/responses_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyB_3y7F5CzrMJeoT1KS98HM7l0jQmpRdmY",
    appId: "1:664837453344:web:1eb4f4172efe260b00ae45",
    messagingSenderId: "664837453344",
    projectId: "myuconnect-39f26",
  ));
  setUp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => GetIt.I<ResponsesProvider>())
      ],
      child: MaterialApp(
        title: "Demo",
        home: Dashboard(email: "jsgonzalez13@utpl.edu.ec"),
      ),
    );
  }
}
