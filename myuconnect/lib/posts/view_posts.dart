import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myuconnect/Models/post.dart';

class ViewPosts extends StatefulWidget {
  final Post post;
  const ViewPosts({Key? key, required this.post}) : super(key: key);

  @override
  _ViewPostsState createState() => _ViewPostsState();
}

class _ViewPostsState extends State<ViewPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffffffff),
        foregroundColor: const Color(0xff003F72),
        title: Text(
          widget.post.titulo,
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ),
      body: Center(
        child: Text(widget.post.id),
      ),
    );
  }
}
