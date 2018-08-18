import 'package:flutter/material.dart';
import 'package:russ_movie_list/models/movielist/movielist_item.dart';

class MovieListCard extends StatelessWidget {
  MovieListCard({this.movie});

  final MovieListItem movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(6.0),
      child: Row(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(0.0),
              child: Image.network(
                movie.poster,
                fit: BoxFit.fitHeight,
              )),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.title,
                    softWrap: true,
                  ),
                  Text(
                    movie.year.toString(),
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    movie.director,
                  ),
                  Text(
                    movie.actors,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
