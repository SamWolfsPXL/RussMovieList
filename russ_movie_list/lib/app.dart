import 'package:flutter/material.dart';
import 'package:russ_movie_list/pages/movielist_page.dart';

class MovieListApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Russ\' Movie List',
      theme: _kAppTheme,
      home: new MovieListPage(),
    );
  }
}

final ThemeData _kAppTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith();
}
