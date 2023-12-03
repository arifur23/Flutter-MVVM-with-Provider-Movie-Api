import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider_api/data/response/status.dart';
import 'package:flutter_mvvm_provider_api/view_model/movie_view_model.dart';
import 'package:provider/provider.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {

  MovieViewModel movieViewModel = MovieViewModel();

  @override
  void initState() {
    movieViewModel.fetchMovieListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider<MovieViewModel>(
        create: (context) => movieViewModel,
        child: Consumer<MovieViewModel>(
          builder: (context, value, child){
            switch(value.movieList.status){
              case Status.LOADING :
                return const Center(child:  CircularProgressIndicator(),);
              case Status.ERROR :
                return const Center(child: CircularProgressIndicator(),);
              case Status.COMPLETED :
                return Container(
                  height: size.height * .8,
                  width: size.width * .8,
                  child: Center(
                    child: ListView.builder(
                        itemBuilder: (context, index) => ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              height : 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: Image.network('${value.movieList.data!.movies![index].imdbUrl}'),
                    ),
                          ),
                          title: Text(value.movieList.data!.movies![index].movie!),
                          subtitle: Text(value.movieList.data!.movies![index].rating.toString()),
                        ),
                      itemCount: value.movieList.data!.movies!.length,
                    ),
                  ),
                );
            }
          }
        ),
      ),
    );
  }
}
