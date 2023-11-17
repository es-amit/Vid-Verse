

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vidverse/screens/authentication/login_screen.dart';

class SplashServcies{

  void isLogin(BuildContext context){
    

    Timer(Duration(milliseconds: 10),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
    });
  }

}