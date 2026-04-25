import 'package:flutter/material.dart';
import 'package:space/core/confg/routes.dart';
import 'package:space/core/constants/app_theme.dart';

import 'package:space/planet_details_screen/planet_details_view.dart';
import 'package:space/presentation/home_screen/home_view.dart';
import 'package:space/presentation/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,

      initialRoute: Routes.login,
      routes: {
        Routes.login: (context) => const LoginScreen(),
        Routes.home: (context) => const HomeView(),
        Routes.planetDetails: (context) => const PlanetDetailsView(),
      },
    );
  }
}
