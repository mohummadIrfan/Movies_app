import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_course/data/response/status.dart';
import 'package:provider_course/res/app_colors.dart';

import '../view_model/movies_provider.dart';
import 'movies_details_screen.dart';

class MoviesLists extends StatefulWidget {
  const MoviesLists({super.key});

  @override
  State<MoviesLists> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesLists> {
  MoviesProvider moviesProvider = MoviesProvider();

  @override
  void initState() {
    moviesProvider.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movies List")),
      body: ChangeNotifierProvider<MoviesProvider>(
        create: (context) => moviesProvider,
        child: Consumer<MoviesProvider>(
          builder: (context, value, _) {
            switch (value.movieList.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text("Error: ${value.movieList.message}"));
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: value.movieList.data!.movies!.length,
                  itemBuilder: (context, index) {
                    final movie = value.movieList.data!.movies![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailsScreen(movie: movie),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: AppColors.pinkColor,
                          child: ListTile(
                            leading: Image.network(movie.posterurl.toString()),
                            title: Text(movie.title.toString()),
                            subtitle: Text(movie.year.toString()),
                          ),
                        ),
                      ),
                    );
                  },
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );

  }
}
