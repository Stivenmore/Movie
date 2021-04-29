import 'dart:convert';

import 'package:movies/domain/entities/models_movie.dart';
import 'package:movies/domain/services/ServicesResult.dart';
import 'package:http/http.dart' as http;

class MovieRepository extends ServiceResult {
  http.Client client;

  MovieRepository(this.client);

  Future<ServiceResult<List<MovieModel>>> getmovie(String collecion) async {
    try {
      String apikey = 'api_key=880c434e2d40fb9f2acd3f9773d8296e';
      var url = Uri.parse(
          'https://api.themoviedb.org/3/movie/' + collecion + '?' + apikey);
      var response =
          await client.get(url, headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        print('hemos entrado en el if');
        var data = jsonDecode(response.body);

        List<MovieModel> moviemodel = (data['results'] as Iterable)
            .map((e) => MovieModel.fromJson(e))
            .toList();
        return ServiceResult(data: moviemodel);
      } else {
        print('hemos entrado en el else');
        return ServiceResult(mensagge: 'Sin señal');
      }
    } catch (e) {
      return ServiceResult(mensagge: e.toString());
    }
  }
}
