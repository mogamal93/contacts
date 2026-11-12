import 'dart:async';
import 'package:contact/screens/HomeScreen.dart';
import 'package:contact/theme/AppColors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  HomeScreen(),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Center(
             child: SizedBox(
               width: MediaQuery.of(context).size.width * .5,
               child: Image.asset("assets/images/logo.png"),
             ),
           )
         ],
        ),
      ),
    );
  }
}