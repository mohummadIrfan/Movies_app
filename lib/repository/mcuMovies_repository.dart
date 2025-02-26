
import 'package:provider_course/data/network/base_api_response.dart';
import 'package:provider_course/data/network/network_api_response.dart';
import 'package:provider_course/res/appsUrl.dart';

import '../model/mcu_movies_Model.dart';

class McuMoviesRepository{

  BaseApiResponse _apiResponse =NetworkApiResponse() ;

  Future<McuMoviesModel> fetchMcuMovies() async{
     try{
    dynamic  response =  await _apiResponse.getGetApiResponse(AppsUrl.moviesMcuUrl);

     return response = McuMoviesModel.fromJson(response);
  } catch (e){
       throw e;
     }
}}