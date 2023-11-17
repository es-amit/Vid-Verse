

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vidverse/screens/authentication/signup_screen.dart';
import 'package:vidverse/widgets/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey =  GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return true;
      },
      child: Expanded(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Login'),
          ),
          body:  Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/login.png',
                height: 280,
                width: 350,),
                const SizedBox(height: 10,),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      customTextField(controller: emailController, title: "Email",obsecureText: false,),
                      const SizedBox(height: 10,),
                      customTextField(controller: passwordController, title: "Password",obsecureText: true,),
          
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: (){
                            print('object');
                        }, 
                        child: const Text("Forgot Password?")),
                      )
                    ],
                  )),
          
                const SizedBox(height: 50,),
                RoundButton(
                  title: 'Login',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print('hello');
                    }
                  },
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));
                      }, 
                      child: const Text('Sign up'))
                  ],
                )
          
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}