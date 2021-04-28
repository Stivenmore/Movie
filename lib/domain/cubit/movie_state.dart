part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {
  List<Object> get props => [];
}

class MovieLoaded extends MovieState {
  final List<MovieModel> movie;

  MovieLoaded({this.movie});

  List<Object> get props => [movie];
}

// ignore: must_be_immutable
class MovieError extends MovieState {
  String message;

  MovieError({this.message});
  List<Object> get props => [message];
}

