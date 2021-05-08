import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task/model/movie.dart';
import 'package:flutter_app_task/model/request_response.dart';
import 'package:flutter_app_task/repository/custom_exception.dart';


enum TypeMovies {TopMovies, UpcomingMpvies}

class MoviesApiClient {
  static String baseURL = 'https://api.themoviedb.org/3';
  static String apiKey = 'e919ab6eb862c1077ebdfba53cdf4ed2';
  static String defaultConfiguration = 'language=en-US';
  static String upcomingMoviesURL = '';


  Future<List<Movie>> fetchMovies(int page, TypeMovies typeMovies) async {
    switch (typeMovies) {
      case TypeMovies.TopMovies:
        upcomingMoviesURL =
        '$baseURL/movie/top_rated?api_key=$apiKey&$defaultConfiguration';
        break;
      case TypeMovies.UpcomingMpvies:
        upcomingMoviesURL =
        '$baseURL/movie/upcoming?api_key=$apiKey&$defaultConfiguration';
        break;
    }
    Response response = await Dio().get(upcomingMoviesURL + '&page=$page');
    return _response(response);
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = RequestResponse
            .fromJson(response.data)
            .results;
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode: ${response
                .statusCode}');
    }
  }
}
