import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moviesapp/screens/home_screen.dart';
import 'package:moviesapp/screens/movies_screen.dart';

import '../controllers/main_controller.dart';
import '../services/api_helper.dart';


class NavigationToggle extends StatefulWidget {
  const NavigationToggle({super.key});

  @override
  State<NavigationToggle> createState() => _NavigationToggleState();
}

class _NavigationToggleState extends State<NavigationToggle> {
  int _currentPageIndex = 0;

  final _screens = [const HomeScreen(), const MovieListScreen()];

  @override
  void initState() {
    super.initState();
    fetchMovies(); // Fetch movies on widget initialization
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final controller = Get.put(MainController());

    return Scaffold(
      body: _screens[_currentPageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: theme.scaffoldBackgroundColor,
        ),
        child: NavigationBar(
          selectedIndex: _currentPageIndex,

          // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorColor: Colors.transparent,
          onDestinationSelected: (index) =>
              setState(() => _currentPageIndex = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.house, color: Colors.white),
              selectedIcon: Icon(Iconsax.house, color: Color(0xffF2C94C)),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.search_normal_1, color: Colors.white),
              selectedIcon:
                  Icon(Iconsax.search_normal_1, color: Color(0xffF2C94C)),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.bookmark, color: Colors.white),
              selectedIcon: Icon(Icons.home, color: Color(0xffF2C94C)),
              label: 'Wishlist',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.profile_circle, color: Colors.white),
              selectedIcon:
                  Icon(Iconsax.profile_circle, color: Color(0xffF2C94C)),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
