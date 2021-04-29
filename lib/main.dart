import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/cubit/movie_cubit.dart';
import 'package:movies/ui/pages/splash/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movies',
          theme: ThemeData(accentColor: Colors.white),
          home: SplashScreen()),
    );
  }
}
