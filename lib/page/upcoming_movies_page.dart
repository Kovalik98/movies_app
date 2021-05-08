import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task/bloc/movies_bloc.dart';
import 'package:flutter_app_task/model/movie.dart';
import 'package:flutter_app_task/page/cards/cards_movies.dart';
import 'package:flutter_app_task/repository/movies_api_client.dart';


class UpcomingPage extends StatefulWidget {
  @override
  _UpcomingPageState createState() =>  _UpcomingPageState();
}
class _UpcomingPageState extends State<UpcomingPage> {
  MoviesApiClient moviesRepository = MoviesApiClient();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    weatherBloc.fetchMoviesBloc(TypeMovies.UpcomingMpvies);
    return StreamBuilder(
        stream: weatherBloc.weather,
        builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            return Container(
                child: CardMoviesState(snapshot.data)
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}