import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_course/provider/favourite_provider.dart';
import 'package:provider_course/utlis/routes/routes.dart';
import 'package:provider_course/utlis/routes/routesName.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (_) => FavoriteProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false ,
        title: 'Movies App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RouteName.mcuMovie,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
