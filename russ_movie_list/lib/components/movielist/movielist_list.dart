import 'package:flutter/material.dart';
import 'package:russ_movie_list/components/movielist/movielist_card.dart';
import 'package:russ_movie_list/models/movielist/movielist_item.dart';

class MovieList extends StatelessWidget {
  final List<MovieListItem> data;

  MovieList({Key key, this.data}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return new GridView.builder(
        itemCount: data == null ? 0 : data.length,
        padding: EdgeInsets.all(6.0),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 2.0),
        itemBuilder: (BuildContext context, int index) {
          return new MovieListCard(movie: data[index]);
        },
    );
  }
}
