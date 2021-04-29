import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/data/repository.dart';
import 'package:movies/domain/entities/models_movie.dart';
import 'package:http/http.dart' as http;
import 'package:movies/domain/services/ServicesResult.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository _movieRepository;

  MovieCubit({MovieRepository movieRepository})
      : _movieRepository = movieRepository ?? MovieRepository(http.Client()),
        super(MovieInitial());

  Future<void> getDataApi(String collecion) async {
    ServiceResult<List<MovieModel>> result =
        await _movieRepository.getmovie(collecion);
    if (result.data != null) {
      print('Loaded');
      emit(MovieLoaded(movie: result.data));
    } else {
      print('Error');
      emit(MovieError(message: result.mensagge));
      print(result.mensagge);
    }
  }
}
