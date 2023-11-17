import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vidverse/screens/authentication/login_screen.dart';
import 'package:vidverse/utils/utilities.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth  = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home screen'),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
            }).onError((error, stackTrace){
              Utils().toastMessage(error.toString());
            });


          }, icon: const Icon(Icons.logout_outlined))
        ],
      ),
      
    );
  }
}