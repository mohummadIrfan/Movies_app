
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_course/model/mcu_movies_Model.dart';

class McuDetailsScreen extends StatelessWidget {

  final Data mcuMovies;

  const McuDetailsScreen({super.key , required this.mcuMovies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: Text("title:${mcuMovies.title}")
      ),
      body:  SingleChildScrollView (
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: [

              Text("title:${mcuMovies.title}"),
              const SizedBox(height: 10),
              ClipRRect(
                  borderRadius:BorderRadius.circular(10),
                  child: Image.network(mcuMovies.coverUrl.toString(),fit:BoxFit.cover)) ,
              const SizedBox(height: 10),
              Text("overView:\n ${mcuMovies.overview}"),



            ],
          ),
        ),
      ),
    );
  }
}