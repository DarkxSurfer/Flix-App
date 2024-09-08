import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapp/constants/theme.dart';
import 'package:moviesapp/screens/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.dark,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      home: const NavigationToggle(),
      debugShowCheckedModeBanner: false,
    );
  }
}
