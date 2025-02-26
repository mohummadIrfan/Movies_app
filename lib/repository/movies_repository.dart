
import 'package:provider_course/data/network/base_api_response.dart';
import 'package:provider_course/data/network/network_api_response.dart';
import 'package:provider_course/res/appsUrl.dart';
import 'package:provider_course/utlis/utlis.dart';

import '../model/movie_model_list.dart';

class MoviesRepository{

  BaseApiResponse _apiServices = NetworkApiResponse() ;

  Future<MoviesList> fetchMoviesList() async {

    try {
     dynamic  response = await _apiServices.getGetApiResponse(AppsUrl.moviesUrl);
      return  response = MoviesList.fromJson(response);

    } catch(e){
      Utlis.toastMessage(e.toString());
       throw e;

    }
  }
}