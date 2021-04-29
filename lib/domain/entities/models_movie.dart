import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class MovieModel extends Equatable {
  final int id;
  final String name;
  final String startdate;
  final String urlimage;
  final double popularity;
  final String overview;
  final int votecount;
  var voteaverage;

  MovieModel(
      {this.voteaverage,
      this.votecount,
      this.popularity,
      this.id,
      this.name,
      this.startdate,
      this.urlimage,
      this.overview});

  factory MovieModel.fromJson(Map<String, dynamic> map) => MovieModel(
      name: map['original_title'],
      id: map['id'] as int,
      startdate: map['release_date'],
      urlimage: map['poster_path'],
      overview: map['overview'],
      popularity: map['popularity'] as double,
      votecount: map['vote_count'] as int,
      voteaverage: map['vote_average']);

  @override
  List<Object> get props =>
      [id, name, overview, startdate, urlimage, votecount, popularity];
}
