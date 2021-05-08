import 'package:flutter_app_task/model/movie.dart';
import 'package:flutter_app_task/repository/movies_api_client.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  MoviesApiClient _repository = MoviesApiClient();

  //Create a PublicSubject object responsible to add the data which is got from
  // the server in the form of WeatherResponse object and pass it to the UI screen as a stream.
  final _weatherFetcher = PublishSubject<List<Movie>>();

  //This method is used to pass the weather response as stream to UI
  Observable<List<Movie>> get weather => _weatherFetcher.stream;

  fetchMoviesBloc(TypeMovies typeMovies) async {
    List<Movie> weatherResponse = await _repository.fetchMovies(1, typeMovies);
      _weatherFetcher.sink.add(weatherResponse);
  }

  dispose() {
    //Close the weather fetcher
    _weatherFetcher.close();
  }
}

final weatherBloc = MoviesBloc();
