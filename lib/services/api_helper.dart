import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/movie_models.dart';

Future<List<Movie>> fetchMovies() async {
  const url = 'https://freetestapi.com/api/v1/movies?limit=5';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
