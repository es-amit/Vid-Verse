

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vidverse/screens/authentication/login_screen.dart';

class SplashServcies{

  void isLogin(BuildContext context){
    

    Timer(Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
    });
  }

}