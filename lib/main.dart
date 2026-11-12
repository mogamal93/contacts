import 'package:contact/screens/HomeScreen.dart';
import 'package:contact/screens/splash_screen.dart';
import 'package:contact/theme/AppTheme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) =>  HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const SplashScreen(),
    );
  }
}

