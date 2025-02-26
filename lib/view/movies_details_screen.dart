import 'package:flutter/material.dart';

import 'package:provider_course/model/movie_model_list.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movies  movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Title: ${movie.title}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView (
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                movie.posterurl ?? '',
                height: 500,
                width: double.infinity,
                fit:BoxFit.fill,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image_not_supported, size: 100),
              ),
              const SizedBox(height: 20),
              Text(
                "Title: ${movie.title}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Year: ${movie.year}",
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                "Description: ${movie.storyline??"No Description"}",
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
