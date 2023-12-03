
class MovieListModel{
  List<Movie>? movies;

  MovieListModel({required this.movies});

  MovieListModel.fromJson(dynamic json) {
     try{
       movies?.addAll(List<Movie>.from(json.map((e) => Movie.fromJson(e))));
     }
     catch(e){
       print(e.toString());
     }
  }
}

class Movie {
  int? id;
  String? movie;
  num? rating;
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
          id = json['id'];
          movie = json['movie'];
          rating = json['rating'];
          image = json['image'];
          imdbUrl = json['imdbUrl'];
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
