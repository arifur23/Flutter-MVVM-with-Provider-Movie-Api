import 'package:flutter_mvvm_provider_api/data/network/base_api_class.dart';
import 'package:flutter_mvvm_provider_api/data/network/movie_api_class.dart';
import 'package:flutter_mvvm_provider_api/model/movie.dart';

class MovieRepository{
  BaseApiClass movieApiClass = MovieApiClass();
  
  Future<MovieListModel> fetchMovies() async{
    try{
      dynamic response = await movieApiClass.getApiCall('https://dummyapi.online/api/movies');

      return response = MovieListModel.fromJson(response);

    }catch(e){
      throw e;
    }
  }

  Future<Movie> fetchMovie(String id)async{
    try{
      dynamic response = await movieApiClass.getApiCall('https://dummyapi.online/api/movies/$id');
      return response = Movie.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}
