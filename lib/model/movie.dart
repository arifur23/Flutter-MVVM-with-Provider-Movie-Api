
class MovieListModel{
  List<Movie>? movies;

  MovieListModel({required this.movies});

  MovieListModel.fromJson(Map<String, dynamic> json) {
    if(json['movies'] != null){
      movies = <Movie>[];
      for(var movie in json['movies']){
        movies!.add(Movie.fromJson(movie));
      }
    }
  }
}

class Movie {
  int? id;
  String? movie;
  double? rating;
  String? image;
  String? imdbUrl;

  Movie({
    required this.id,
    required this.movie,
    required this.rating,
    required this.image,
    required this.imdbUrl,
  });

  Movie.fromJson(Map<String, dynamic> json) {
          id: json['id'];
          movie: json['movie'];
          rating: json['rating'];
          image: json['image'];
          imdbUrl: json['imdbUrl'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> json = <String, dynamic>{};

    json['id'] = id;
    json['movie'] = movie;
    json['rating'] = rating;
    json['image'] = image;
    json['imdbUrl'] = imdbUrl;

    return json;
  }
}
