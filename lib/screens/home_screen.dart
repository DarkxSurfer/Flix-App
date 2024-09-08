import 'package:flutter/material.dart';
import 'package:moviesapp/models/movie_models.dart';
import 'package:moviesapp/widgets/custom_card.dart';
import 'package:moviesapp/widgets/filters.dart';
import '../constants/image_strings.dart';
import '../services/api_helper.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Movie>>? _moviesFuture;

  @override
  void initState() {
    super.initState();
    _moviesFuture = fetchMovies(); // Fetch movies on widget initialization
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBannerSection(theme),
            // const SizedBox(height: 20),
            _buildMoviesSection(theme, "Marvel Movies", "See more"),
            _buildMoviesSection(theme, "Best Movies", "See more"),
            _buildPromoSection(theme),
          ],
        ),
      ),
    );
  }

  /// Builds the top banner with a background image and filter options
  Widget _buildBannerSection(ThemeData theme) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          _buildBackgroundImage(),
          _buildFiltersOverlay(),
          _buildBottomMenu(theme),
        ],
      ),
    );
  }

  /// Builds the background image
  Widget _buildBackgroundImage() {
    return Image.asset(
      strangerbackground,
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
    );
  }

  /// Builds the filter widget overlay at the top of the banner
  Widget _buildFiltersOverlay() {
    return Positioned(
      top: 10,
      left: 10,
      right: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff42423f).withOpacity(.4),
        ),
        child: const Filters(),
      ),
    );
  }

  /// Builds the menu at the bottom of the banner
  Widget _buildBottomMenu(ThemeData theme) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.black12.withOpacity(.4),
              Colors.black12.withOpacity(.5),
              Colors.black12.withOpacity(.6),
              Colors.black12.withOpacity(.7),
              Colors.black.withOpacity(.7),
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.99),
              Colors.black
            ])),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            _buildMenuOptions(theme),
            const SizedBox(height: 10),
            _buildActionButtons(theme),
          ],
        ),
      ),
    );
  }

  /// Builds the "My List" and "Discover" text options
  Widget _buildMenuOptions(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "My List",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: theme.primaryColor,
          ),
        ),
        const SizedBox(width: 40),
        Text(
          "Discover",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: theme.primaryColor,
          ),
        ),
      ],
    );
  }

  /// Builds the Wishlist and Details buttons at the bottom of the banner
  Widget _buildActionButtons(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildActionButton(
          text: 'Wishlist',
          backgroundColor: const Color(0xff333333),
          textColor: theme.primaryColor,
          onPressed: () {}, // Handle Wishlist press
        ),
        const SizedBox(width: 20),
        _buildActionButton(
          text: 'Details',
          backgroundColor: const Color(0xffF2C94C),
          textColor: theme.iconTheme.color!,
          onPressed: () {}, // Handle Details press
        ),
      ],
    );
  }

  /// Reusable method to build action buttons
  Widget _buildActionButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 48,
        width: 155,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the movie section with the list of movies fetched from the API
  Widget _buildMoviesSection(ThemeData theme, text, textButton) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          _buildMoviesHeader(theme, text, textButton),
          const SizedBox(height: 10),
          _buildMoviesList(),
        ],
      ),
    );
  }

  /// Builds the header for the movies section
  Widget _buildMoviesHeader(ThemeData theme, text, textButton) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            color: theme.primaryColor,
            fontSize: 18,
          ),
        ),
        Text(
          textButton,
          style: const TextStyle(
            color: Color(0xffF2C94C),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  /// Builds the FutureBuilder that handles the movie list display
  Widget _buildMoviesList() {
    return FutureBuilder<List<Movie>>(
      future: _moviesFuture, // Use the cached future
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No movies found'));
        } else {
          final movies = snapshot.data!;
          return SizedBox(
            height: 300, // Set a height to constrain the ListView
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return CustomCard(imageUrl: movie.poster, title: movie.title);
              },
            ),
          );
        }
      },
    );
  }

  /// Builds the promotional section (Black Friday Promo)
  Widget _buildPromoSection(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            blackfridayimage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 165,
          ),
          const SizedBox(height: 10),
          Text(
            "Black Friday is here!",
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra sociis pulvinar auctor nibh nibh iaculis id.",
            style: TextStyle(
              color: theme.primaryColor.withOpacity(.4),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),
          CustomButton(
            text: 'Check Details',
            color: const Color(0xffF2C94C),
            onPressed: () {
              // Handle button press
            },
          ),
        ],
      ),
    );
  }
}
