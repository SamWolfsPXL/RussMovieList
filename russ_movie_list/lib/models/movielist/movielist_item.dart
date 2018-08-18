import 'package:meta/meta.dart';

class MovieListItem {
  const MovieListItem({
    @required this.title,
    @required this.year,
    @required this.director,
    @required this.actors,
    @required this.poster,
  }) : assert(title != null),
       assert(year != null),
       assert(director != null),
       assert(actors != null),
       assert(poster != null);

  final String title;
  final int year;
  final String director;
  final String actors;
  final String poster;

  factory MovieListItem.fromJson(Map<String, dynamic> json) {
    return MovieListItem(
      title: json['Title'],
      year: int.parse(json['Year']),
      director: json['Director'],
      actors: json['Actors'],
      poster: json['Poster']
    );
  }

}