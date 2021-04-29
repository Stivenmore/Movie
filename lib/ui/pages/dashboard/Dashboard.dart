import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/cubit/movie_cubit.dart';
import 'package:movies/ui/pages/dashboard/states/DashMovieLoaded.dart';
import 'package:movies/ui/pages/splash/SplashScreen.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case MovieLoaded:
            return BlocBuilder<MovieCubit, MovieState>(
              builder: (context, state) => (state is MovieLoaded) ?
              DashMovieLoaded(movieModel: state.movie) : MovieError()
            );
            break;
          case MovieError:
            return BlocBuilder<MovieCubit, MovieState>(
              builder: (context, state) => (state is MovieError) ?
              Scaffold(body: Center(child: Text(state.message),),) : MovieError()
            );
            break;
          case MovieInitial:
            return Scaffold();
            break;
          default:
            return SplashScreen();
        }
      },
    );
  }
}
