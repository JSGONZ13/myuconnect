import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myuconnect/MyPosts/myposts.dart';

import 'Posts/posts.dart';

class MainDashboard extends StatefulWidget {
  final String nickname;
  const MainDashboard({Key? key, required this.nickname}) : super(key: key);

  @override
  _MainDashboardState createState() => _MainDashboardState();

  String getNickName() {
    return nickname;
  }
}

class _MainDashboardState extends State<MainDashboard> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Usuario: "+widget.nickname),
      ),
      extendBody: false,
      body: _index == 0 ? const Posts() : const MyPosts(),
      bottomNavigationBar: FloatingNavbar(
        onTap: (int val) => setState(() => _index = val),
        currentIndex: _index,
        items: [
          FloatingNavbarItem(icon: Icons.assignment_rounded, title: 'Posts'),
          FloatingNavbarItem(icon: Icons.all_inbox_rounded, title: 'Mis Posts'),
        ],
      ),
    );
  }
}
