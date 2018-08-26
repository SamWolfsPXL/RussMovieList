import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:russ_movie_list/components/movielist/movielist_list.dart';
import 'package:russ_movie_list/models/movielist/movielist_item.dart';
import 'package:russ_movie_list/pages/moviesearch_page.dart';

import 'package:http/http.dart' as http;

class MovieListPage extends StatelessWidget {
  MovieListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: _loadList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MovieSearchPage()));
          },
          child: Icon(Icons.add)),
    );
  }

  FutureBuilder<List<MovieListItem>> _loadList() {
    return new FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.hasData
                ? MovieList(data: snapshot.data)
                : Center(child: CircularProgressIndicator());
          } else {
            print(snapshot.error);
          }
        });
  }

  Future<List<MovieListItem>> fetchData() async {
    final response =
        await http.get('http://www.omdbapi.com/?i=tt3896198&apikey=82563d72');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return List.generate(10, (index) {
        return MovieListItem.fromJson(json.decode(response.body));
      });
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
