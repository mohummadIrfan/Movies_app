
import 'package:flutter/material.dart';
import 'package:provider_course/data/response/api_response.dart';
import 'package:provider_course/model/movie_model_list.dart';
import 'package:provider_course/repository/movies_repository.dart';
import 'package:provider_course/utlis/utlis.dart';

class MoviesProvider with  ChangeNotifier{

  final _myRepo= MoviesRepository();
  ApiResponse<MoviesList>  movieList = ApiResponse.loading();

  setMovies(ApiResponse<MoviesList> response) {

    movieList = response;
    notifyListeners() ;
  }

  Future<void>fetchMoviesListApi()async{
  setMovies(ApiResponse.loading());
   _myRepo.fetchMoviesList().then((value) => {
    setMovies(ApiResponse.completed(value)),

     print("fetch Movies"),

    }).onError((error, stackTrace) => {
   setMovies(ApiResponse.error( error.toString())),
      print("error"),
     Utlis.toastMessage(error.toString())
   });
  }

}