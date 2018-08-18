import 'package:meta/meta.dart';

import 'package:russ_movie_list/models/search/moviesearch_item.dart';

class SearchResult {
  const SearchResult({
    @required this.data
  }) : assert(data != null);

  final List<MovieSearchItem> data;

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    var list = json['Search'] as List;
    return SearchResult(
      data: list.map((item) => MovieSearchItem.fromJson(item)).toList(),
    );
  }
}