import 'package:flutter/material.dart';
import 'package:movies/view/home/home.dart';
import 'package:movies/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff121312),
            iconTheme: IconThemeData(
              size: 20,
              color: Colors.white,
            ),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
            )),
        scaffoldBackgroundColor: const Color(0xff121312),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Color(0xffFFB324),
            unselectedItemColor: Colors.white,
            selectedIconTheme: IconThemeData(size: 34)),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff121312)),
        useMaterial3: true,
      ),
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        Home.routeName: (context) => const Home(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
