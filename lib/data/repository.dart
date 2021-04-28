import 'dart:convert';

import 'package:movies/domain/entities/models_movie.dart';
import 'package:movies/domain/services/ServicesResult.dart';
import 'package:http/http.dart' as http;

class MovieRepository extends ServiceResult {
  http.Client client;

  MovieRepository(this.client);

  Future<ServiceResult<List<MovieModel>>> getmovie(int page) async {
    try {
      var url =
          Uri.parse('https://www.episodate.com/api/most-popular?page=$page');
      var response =
          await client.get(url, headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        List<MovieModel> moviemodel =
            (data['tv_shows'] as Iterable).map((e) => MovieModel.fromJson(e)).toList();
        return ServiceResult(data: moviemodel);
      } else {
        return ServiceResult(mensagge: 'Sin señal');
      }
    } catch (e) {
      return ServiceResult(mensagge: e.toString());
    }
  }
}
