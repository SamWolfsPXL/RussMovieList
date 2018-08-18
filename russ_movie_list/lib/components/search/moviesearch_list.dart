import 'package:flutter/material.dart';
import 'package:russ_movie_list/components/search/moviesearch_card.dart';
import 'package:russ_movie_list/models/search/moviesearch_item.dart';

class MovieSearchList extends StatelessWidget {
  final List<MovieSearchItem> data;

  MovieSearchList({Key key, this.data}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return new GridView.builder(
        itemCount: data == null ? 0 : data.length,
        padding: EdgeInsets.all(6.0),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 2.0),
        itemBuilder: (BuildContext context, int index) {
          return new MovieSearchCard(movie: data[index]);
        },
    );
  }
}
