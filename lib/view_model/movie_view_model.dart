import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider_api/data/repository/movie_repository.dart';
import 'package:flutter_mvvm_provider_api/data/response/api_response.dart';
import 'package:flutter_mvvm_provider_api/model/movie.dart';

class MovieViewModel with ChangeNotifier{

  final movieRepository = MovieRepository();

  ApiResponse<MovieListModel> movieList = ApiResponse.loading();

  setMovieList(ApiResponse<MovieListModel> response){
    movieList = response;
    notifyListeners();
  }

  Future<void> fetchMovieListApi () async{
    setMovieList(ApiResponse.loading());
    movieRepository.fetchMovies().then((value) {
      setMovieList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMovieList(ApiResponse.error());
    });
  }
}