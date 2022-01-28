// ignore: file_names
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainDashboard extends StatelessWidget {
  final String nickname;
  MainDashboard({Key? key, required this.nickname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(this.nickname),
      ),
    );
  }
}
