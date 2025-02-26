// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';


import 'package:provider_course/utlis/routes/routesName.dart';
import 'package:provider_course/view/mcuMovies_view.dart';
import 'package:provider_course/view/moviesList.dart';

import '../../view/favourite/favourite_screen.dart';
import '../../view/movies_details_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => const FavouriteApp());
      case RouteName.movieList :
        return MaterialPageRoute(builder: (context) => const MoviesLists());
      case RouteName.mcuMovie:
      return  MaterialPageRoute(
     builder: (context) => const McuMoviesView(),
   );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No Routes Found"),
            ),
          ),
        );
    }
  }
}
