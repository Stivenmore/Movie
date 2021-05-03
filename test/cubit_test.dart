import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/domain/cubit/movie_cubit.dart';

void main() {
  blocTest(
    'Test en funcion de pasar parametros adecuados a nuestra funcion get Api',
    build: () => MovieCubit(),
    act: (MovieCubit cubit) async{
     await cubit.getDataApi('popular');
    },
    expect: () => [isA<MovieInitial>(), isA<MovieLoaded>()],
  );
  blocTest(
    'Test en funcion no de pasar parametro adecuados a nuestra funcion get Api',
    build: () => MovieCubit(),
    act: (MovieCubit cubit) async{
     await cubit.getDataApi('');
    },
    expect: () => [isA<MovieInitial>(), isA<MovieError>()],
  );
}
