import 'package:flutter/material.dart';
import 'package:flutter_practice/W8%20-%20PRACTICE/EXERCISE-4/data/jokes.dart';
import 'package:flutter_practice/W8%20-%20PRACTICE/EXERCISE-4/ui/favorite_card.dart';

class JokesApp extends StatefulWidget {
  const JokesApp({super.key});

  @override
  State<JokesApp> createState() => _JokesAppState();
}

class _JokesAppState extends State<JokesApp> {
  String? _favoriteJokeId;

  void _setFavoriteJoke(String JokeId) {
    setState(() {
      if (_favoriteJokeId == JokeId) {
        _favoriteJokeId = null;
      } else {
        _favoriteJokeId = JokeId;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green[300],
          title: const Text("Favorite Jokes"),
        ),
        body: ListView.builder(
          itemCount: jokes.length,
          itemBuilder: (context, index) {
            final joke = jokes[index];
            final isFavorite = _favoriteJokeId == joke.id;

            return FavoriteCard(
              title: joke.title,
              description: joke.description,
              isFavorite: isFavorite,
              onFavoriteClick: () => _setFavoriteJoke(joke.id),
            );
          },
        ),
      ),
    );
  }
}
