import 'package:meta/meta.dart';

class MovieSearchItem {
  const MovieSearchItem({
    @required this.title,
    @required this.year,
    @required this.type,
    @required this.poster,
  }) : assert(title != null),
       assert(year != null),
       assert(type != null),
       assert(poster != null);

  final String title;
  final String year;
  final String type;
  final String poster;

  factory MovieSearchItem.fromJson(dynamic json) {
    return MovieSearchItem(
      title: json['Title'],
      year: json['Year'],
      type: json['Type'],
      poster: json['Poster']
    );
  }
}