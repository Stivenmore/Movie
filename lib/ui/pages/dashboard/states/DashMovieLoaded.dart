import 'package:flutter/material.dart';
import 'package:movies/domain/entities/models_movie.dart';

class DashMovieLoaded extends StatefulWidget {
  final List<MovieModel> movieModel;
  const DashMovieLoaded({Key key, @required this.movieModel}) : super(key: key);

  @override
  _DashMovieLoadedState createState() => _DashMovieLoadedState();
}

class _DashMovieLoadedState extends State<DashMovieLoaded> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Movies',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                    ),
                    IconButton(icon: Icon(Icons.search), onPressed: () {})
                  ],
                ),
                Text(
                  ' Watch your movie favorite',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 350,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: widget.movieModel
                        .sublist(0, 10)
                        .map((e) => Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Flexible(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 300,
                                      height: 257,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://www.themoviedb.org/t/p/w220_and_h330_face' +
                                                    e.urlimage),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      width: 300,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Flexible(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    e.name,
                                                    style: TextStyle(
                                                        fontSize: 20.0),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                      'Popularidad: ' +
                                                          e.popularity
                                                              .toString(),
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.grey,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text(e.voteaverage.toString(),
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.grey,
                                                    )),
                                                Icon(
                                                  Icons.star_outlined,
                                                  color: Colors.orange,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                Text(
                  'From Prime Video',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                ),
                Container(
                  height: 350,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: widget.movieModel
                        .sublist(10, 20)
                        .map((e) => Padding(
                              padding: EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  bottom:
                                      (e == widget.movieModel.last ? 22 : 0)),
                              child: Flexible(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://www.themoviedb.org/t/p/w220_and_h330_face' +
                                                    e.urlimage),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.name,
                                              style: TextStyle(fontSize: 20.0),
                                              overflow: TextOverflow.fade,
                                            ),
                                            const SizedBox(height: 5,),
                                            Text(
                                                'Popularidad: ' +
                                                    e.popularity.toString(),
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey,
                                                )),
                                            const SizedBox(height: 10,),
                                            Row(
                                                children: [
                                                  Text(e.voteaverage.toString(),
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.grey,
                                                      )),
                                                  Icon(
                                                    Icons.star_outlined,
                                                    color: Colors.orange,
                                                  )
                                                ],
                                              ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
