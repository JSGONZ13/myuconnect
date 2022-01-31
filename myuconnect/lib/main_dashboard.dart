import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myuconnect/MyPosts/myposts.dart';

import 'Posts/posts.dart';

// ignore: must_be_immutable
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
        backgroundColor: const Color(0xffffffff),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Usuario " + widget.nickname,
          style: GoogleFonts.montserrat(
              color: const Color(0xff003F72),
              fontWeight: FontWeight.w400,
              fontSize: 20),
        ),
      ),
      extendBody: false,
      body: _index == 0 ? Posts(nickname: widget.nickname) : MyPosts(),
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
