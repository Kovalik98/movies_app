import 'package:flutter/material.dart';
import 'package:flutter_app_task/Type/data_type.dart';
import 'package:flutter_app_task/model/movie.dart';
import 'package:flutter_app_task/page/movie_detail.dart';

class CardMoviesState extends StatefulWidget {
  final List<Movie> posts;

  const CardMoviesState(this.posts);

  _CardMoviesState createState() => _CardMoviesState();
}

class _CardMoviesState extends State<CardMoviesState> {
  DataType dataType = DataType();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.greenAccent, Colors.blue])),
      child: GridView.count(
        crossAxisCount: 2,
        children: List<Widget>.generate(widget.posts.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridTile(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MovieDetail(widget.posts[index]);
                  }));
                },
                child: Container(
                    height: 600,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500/${widget.posts[index].posterPath}"),
                            fit: BoxFit.fitWidth)),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Spacer(),
                          Container(
                            color: Colors.black.withOpacity(0.6),
                            height: 50,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8, right: 2, bottom: 2),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                          child: Text(
                                              "${widget.posts[index].id}  " +
                                                  widget.posts[index].title,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis)),
                                    ],
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                        dataType.getPosts(
                                            widget.posts[index].releaseDate),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          );
        }),
      ),
    ));
  }
}
