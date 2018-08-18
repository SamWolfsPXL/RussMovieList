import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:russ_movie_list/components/search/moviesearch_list.dart';
import 'package:russ_movie_list/models/search/moviesearch_item.dart';
import 'package:russ_movie_list/models/search/search_result.dart';
import 'package:http/http.dart' as http;

class MovieSearchPage extends StatefulWidget {
  @override
  MovieSearchPageState createState() => new MovieSearchPageState();
}

class MovieSearchPageState extends State<MovieSearchPage> {
  Widget appBarTitle = new Text('Search');
  Icon actionIcon = new Icon(Icons.search, color: Colors.white,);
  bool searching = false;
  final searchController = new TextEditingController();

  @override
  void initState() {
    search('');
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (searching) {
                  searching = false;
                  this.actionIcon = new Icon(Icons.close);
                  this.appBarTitle = new TextField(
                    autofocus: true,
                    controller: searchController,
                    onSubmitted: search,
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.white),
                        hintText: 'Search...',
                        hintStyle: new TextStyle(color: Colors.white),
                        border: InputBorder.none
                  ));
                } else {
                  searching = true;
                  this.actionIcon = new Icon(Icons.search);
                  this.appBarTitle = new Text('Search');
                }
              });
            },
          )
        ],
      ),
      body: _loadList()
    );
  }

  FutureBuilder<List<MovieSearchItem>> _loadList() {
    return new FutureBuilder(
        future: search(searchController.text),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.hasData
                ? MovieSearchList(data: snapshot.data)
                : Center(child: CircularProgressIndicator());
          } else {
            print(snapshot.error);
          }
        });
  }

  Future<List<MovieSearchItem>> search(String value) async {
    if (value.length < 1) {
      return List<MovieSearchItem>();
    }
    final response =
        await http.get('http://www.omdbapi.com/?s=' + value.trim() + '&apikey=82563d72');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return parseMovies(response.body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  List<MovieSearchItem> parseMovies(String responseBody) {
    final result = SearchResult.fromJson(json.decode(responseBody));
    return result.data;
  }
}
