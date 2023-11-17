import 'package:flutter/material.dart';
import 'package:vidverse/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServcies splashScreen = SplashServcies();

  @override
  void initState() {
    super.initState();
    splashScreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),

    );
  }
}