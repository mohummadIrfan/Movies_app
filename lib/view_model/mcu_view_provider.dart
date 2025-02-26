
import 'package:flutter/cupertino.dart';
import 'package:provider_course/data/response/api_response.dart';
import 'package:provider_course/model/mcu_movies_Model.dart';
import 'package:provider_course/repository/mcuMovies_repository.dart';

class McuMoviesProvider with ChangeNotifier{
  final _myRepo =McuMoviesRepository();
  ApiResponse<McuMoviesModel> mcuMovies = ApiResponse.loading();

  setMcuMovies(ApiResponse<McuMoviesModel> response){
    mcuMovies = response ;
    notifyListeners() ;
  }
  Future<void> fetchMcuMovieApi() async{
    setMcuMovies(ApiResponse.loading() );
    _myRepo.fetchMcuMovies().then((value) {
   setMcuMovies(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
  setMcuMovies( ApiResponse.error(error.toString() ));
      print(error.toString());

    });
  }
}