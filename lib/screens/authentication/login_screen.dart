// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vidverse/screens/authentication/signup_screen.dart';
import 'package:vidverse/screens/home.dart';
import 'package:vidverse/utils/utilities.dart';
import 'package:vidverse/widgets/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    )
        .then((value) {
      setState(() {
        loading = false;
      });
      Utils().toastMessage("Logged in successfully!");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    }).catchError((error) {
      setState(() {
        loading = false;
      });
      Utils().toastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    customTextField(controller: emailController, title: 'Email', obsecureText: false),
                    const SizedBox(height: 10),
                    customTextField(controller: passwordController, title: 'Password', obsecureText: true),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          print('Forgot Password?');
                        },
                        child: const Text("Forgot Password?"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              RoundButton(
                loading: loading,
                title: 'Login',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    login();
                  }
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text('Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
