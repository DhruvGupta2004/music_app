import 'package:amazon_music_app/screens/homeScreen.dart';
import 'package:amazon_music_app/screens/loadingScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: const LoadingScreen(),
    // theme: ThemeData.dark(),
    initialRoute: '/',
    routes: {
      '/': (context) => const LoadingScreen(),
      '/home': (context) => const HomePage(),
    },
  ));
}
