import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  final int id;
  final String name;
  final String permalink;
  final String startdate;
  final String enddate;
  final String country;
  final String network;
  final String urlimage;

  MovieModel(
      {this.id,
      this.name,
      this.permalink,
      this.startdate,
      this.enddate,
      this.country,
      this.network,
      this.urlimage});

  factory MovieModel.fromJson(Map<String, dynamic> map) => MovieModel(
        name: map['name'],
        id: map['id'] as int,
        permalink: map['permalink'],
        startdate: map['start_date'],
        enddate: map['end_date'],
        country: map['country'],
        network: map['network'],
        urlimage: map['image_thumbnail_path'],
  );

  @override
  List<Object> get props => [id, name, permalink, startdate, enddate, country, network, urlimage];
}
