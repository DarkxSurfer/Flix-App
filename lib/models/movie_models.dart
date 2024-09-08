class Welcome {
  int id;
  String title;
  int year;
  List<String> genre;
  double rating;
  String director;
  List<String> actors;
  String plot;
  String poster;
  String trailer;
  int runtime;
  String awards;
  String country;
  String language;
  String boxOffice;
  String production;
  String website;

  Welcome({
    required this.id,
    required this.title,
    required this.year,
    required this.genre,
    required this.rating,
    required this.director,
    required this.actors,
    required this.plot,
    required this.poster,
    required this.trailer,
    required this.runtime,
    required this.awards,
    required this.country,
    required this.language,
    required this.boxOffice,
    required this.production,
    required this.website,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: int.tryParse(json["id"].toString()) ?? 0, // Handle as String or int
        title: json["title"] ?? '',
        year: int.tryParse(json["year"].toString()) ??
            0, // Handle as String or int
        genre: List<String>.from(json["genre"].map((x) => x.toString())),
        rating: double.tryParse(json["rating"].toString()) ??
            0.0, // Handle as String or double
        director: json["director"] ?? '',
        actors: List<String>.from(json["actors"].map((x) => x.toString())),
        plot: json["plot"] ?? '',
        poster: json["poster"] ?? '',
        trailer: json["trailer"] ?? '',
        runtime: int.tryParse(json["runtime"].toString()) ??
            0, // Handle as String or int
        awards: json["awards"] ?? '',
        country: json["country"] ?? '',
        language: json["language"] ?? '',
        boxOffice: json["boxOffice"] ?? '',
        production: json["production"] ?? '',
        website: json["website"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "year": year,
        "genre": List<dynamic>.from(genre.map((x) => x)),
        "rating": rating,
        "director": director,
        "actors": List<dynamic>.from(actors.map((x) => x)),
        "plot": plot,
        "poster": poster,
        "trailer": trailer,
        "runtime": runtime,
        "awards": awards,
        "country": country,
        "language": language,
        "boxOffice": boxOffice,
        "production": production,
        "website": website,
      };
}

class Movie {
  final int id;
  final String title;
  final int year;
  final List<String> genre;
  final double rating;
  final String director;
  final List<String> actors;
  final String plot;
  final String poster;
  final String trailer;
  final int runtime;
  final String awards;
  final String country;
  final String language;
  final String boxOffice;
  final String production;
  final String website;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.genre,
    required this.rating,
    required this.director,
    required this.actors,
    required this.plot,
    required this.poster,
    required this.trailer,
    required this.runtime,
    required this.awards,
    required this.country,
    required this.language,
    required this.boxOffice,
    required this.production,
    required this.website,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      genre: List<String>.from(json['genre']),
      rating: json['rating'].toDouble(),
      director: json['director'],
      actors: List<String>.from(json['actors']),
      plot: json['plot'],
      poster: json['poster'],
      trailer: json['trailer'],
      runtime: json['runtime'],
      awards: json['awards'],
      country: json['country'],
      language: json['language'],
      boxOffice: json['boxOffice'],
      production: json['production'],
      website: json['website'],
    );
  }
}
