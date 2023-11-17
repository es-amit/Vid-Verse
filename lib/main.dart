import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:vidverse/home.dart';
import 'package:vidverse/screens/splash_screen.dart';

Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBMXA2he6fZgTgjS15b1HZuYTCC62ae0lg", 
      appId: "1:297327967261:android:8166dbfb809e2a8b3a1af4", 
      messagingSenderId: "297327967261", 
      projectId: "vidverse-58f95")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SplashScreen(),
    );
  }
}

