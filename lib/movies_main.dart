import 'package:flutter/material.dart';
import 'package:flutter_app_task/page/tabBar_page.dart';


class MoviesApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: TabBarDemo(),
      ),
    );
  }
}