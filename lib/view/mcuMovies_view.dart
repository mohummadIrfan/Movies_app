
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_course/data/response/status.dart';
import 'package:provider_course/res/app_colors.dart';
import 'package:provider_course/view_model/mcu_view_provider.dart';
import 'mcuMovies_details_view.dart';

class McuMoviesView extends StatefulWidget {
  const McuMoviesView({super.key});

  @override
  State<McuMoviesView> createState() => _McuMoviesViewState();
}

class _McuMoviesViewState extends State<McuMoviesView> {
  McuMoviesProvider  mcuMoviesProvider   =McuMoviesProvider();
  @override
  void initState() {
    mcuMoviesProvider.fetchMcuMovieApi();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Mcu Movies"),
        centerTitle: true,
      ),
      body:ChangeNotifierProvider<McuMoviesProvider> (
        create: (BuildContext context)=> mcuMoviesProvider,
        child: Consumer<McuMoviesProvider>(
          builder: (context,value,_) {
            switch (value.mcuMovies.status){
              case Status.LOADING :
                return const Center(child: CircularProgressIndicator()) ;
              case Status.ERROR:
                return  Text("error:${value.mcuMovies.message}");
              case Status.COMPLETED:
                return GridView.builder(
                  padding: const EdgeInsets.all(5),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: value.mcuMovies.data!.data!.length,
                  itemBuilder: (context, index) {
                    final mcuMovie = value.mcuMovies.data!.data![index];

                    return GestureDetector(
                     onTap:   (){
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => McuDetailsScreen(mcuMovies: mcuMovie,)
                       ));
                     },

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15) ,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.whiteColor, width: 3),
                          ),
                          child: Image.network(
                            mcuMovie.coverUrl.toString(),
                            fit: BoxFit.cover,
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
      )
    );
  }
}
