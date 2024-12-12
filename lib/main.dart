import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_demo/view/splash_screen.dart';

// everything https://newsapi.org/v2/everything?q=bitcoin&apiKey=a4d5cb3aa88b44a3860b1f60b417837e
// top headlines https://newsapi.org/v2/top-headlines?country=us&apiKey=a4d5cb3aa88b44a3860b1f60b417837e
void main() {
  GoogleFonts.config.allowRuntimeFetching = false; // Prevent runtime fetching

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
