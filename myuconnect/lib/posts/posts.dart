import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Posts"),
      ),
      body: const ShowPosts(),
    );
  }

  
}

class ShowPosts extends StatelessWidget {
  const ShowPosts({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Presentar posts"),
    );
  }
}
