import 'package:flutter/material.dart';
import 'package:moviesapp/widgets/custom_card.dart';

import '../models/movie_models.dart';
import '../services/api_helper.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: FutureBuilder<List<Movie>>(
        future: fetchMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No movies found'));
          } else {
            final movies = snapshot.data!;
            return GridView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return CustomCard(imageUrl: movie.poster, title: movie.title);

                // ListTile(
                //   title: Text(movie.title),
                //   subtitle: Text('${movie.year} - ${movie.rating}'),
                //   leading: Image.network(movie.poster),
                //   onTap: () {
                //     // Navigate to movie details or show more info
                //   },
                // );
              },
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 30,
                mainAxisSpacing: 10,
              ),
            );
          }
        },
      ),
    );
  }
}
