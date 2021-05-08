import 'package:flutter/material.dart';
import 'package:flutter_app_task/page/upcoming_movies_page.dart';
import 'top_movies_page.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(

          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.yellow], stops: [0.5, 1.0],
                ),
              ),
            ),
            bottom: TabBar(
          indicator: BoxDecoration(
            gradient: LinearGradient(
            colors: const [Color(0xFF10C7E0), Color(0xFF00D5C3)],),),
              tabs: [
                Tab(
                  text: 'Top rated',
                ),
                Tab(
                  text: 'Upcoming',
                ),
              ],
            ),
            title: Text('M o v i e s', style: TextStyle( fontFamily: 'VTKSDistress', fontSize: 30),),
          ),
          body: TabBarView(
            children: [
              TopPage(),
              UpcomingPage(),
            ],
          ),
        ),
    );
  }
}