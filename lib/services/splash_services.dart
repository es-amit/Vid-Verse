import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vidverse/screens/authentication/login_screen.dart';
import 'package:vidverse/screens/home.dart';

class SplashServcies{

  void isLogin(BuildContext context){


    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if(user != null){
      Timer(const Duration(milliseconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
      });
    }
    else{
      Timer(const Duration(milliseconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
    });
    }

    
  }

}