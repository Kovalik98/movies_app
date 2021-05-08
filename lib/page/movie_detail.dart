import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_app_task/Type/data_type.dart';

class MovieDetail extends StatelessWidget {
  final movie;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieDetail(this.movie);
  Color mainColor = const Color(0xff3C3261);
  DataType dataType = DataType();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Stack(fit: StackFit.expand, children: [
         Image.network(
          image_url + movie.posterPath,
          fit: BoxFit.cover,
        ),
         BackdropFilter(
          filter:  ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child:  Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
         SingleChildScrollView(
          child:  Container(
            margin: const EdgeInsets.all(20.0),
            child:  Column(
              children: <Widget>[
                 Container(
                  alignment: Alignment.center,
                  child: new Container(
                    width: 400.0,
                    height: 400.0,
                  ),
                  decoration:  BoxDecoration(
                      borderRadius:  BorderRadius.circular(10.0),
                      image:  DecorationImage(
                          image:  NetworkImage(
                              image_url + movie.posterPath),
                          fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 20.0,
                            offset:  Offset(0.0, 10.0))
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 0.0),
                  child: Column(
                    children: <Widget>[
                     Text(  movie.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontFamily: 'Arvo'),
                          ),
                       Text(
                        movie.overview,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Arvo'),
                      )
                    ],
                  ),
                ),
                 Text(dataType.getPosts(movie.releaseDate),style:  TextStyle(color: Colors.white, fontFamily: 'Arvo')),
                 Padding(padding: const EdgeInsets.all(10.0)),
              ],
            ),
          ),
        )
      ]),
    );
  }
}