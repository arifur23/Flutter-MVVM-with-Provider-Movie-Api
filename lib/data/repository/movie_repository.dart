import 'package:flutter_mvvm_provider_api/data/network/base_api_class.dart';
import 'package:flutter_mvvm_provider_api/data/network/movie_api_class.dart';
import 'package:flutter_mvvm_provider_api/model/movie.dart';
import 'package:flutter_mvvm_provider_api/utils/apiEndPoints/api_end_point.dart';

class MovieRepository{
  BaseApiClass movieApiClass = MovieApiClass();
  
  Future<MovieListModel> fetchMovies() async{
    try{
      dynamic response = await movieApiClass.getApiCall(ApiEndPoints.baseApi);


      // print(  'FROM REPOSITORY BEFORE  DFDF DFDF ' + response.toString() );
      response = MovieListModel.fromJson(response);
      return response;

    }catch(e){
      throw e;
    }
  }

  Future<Movie> fetchMovie(String id)async{
    try{
      var response = await movieApiClass.getApiCall(ApiEndPoints.baseApi+id);
      return response = Movie.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}
