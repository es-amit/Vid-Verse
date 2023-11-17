import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vidverse/screens/authentication/login_screen.dart';
import 'package:vidverse/widgets/round_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Sign Up'),
        ),
        body:  Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PhoneAuth(
                buttonName: "Continue with Phone", 
                imagepath: "assets/phone.svg", 
                size: 25,
                onTap: (){
                  print("phone number");
                },
              ),
              const SizedBox(height: 20,),
              const Text('Or'),
              const SizedBox(height: 20,),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    customTextField(controller: emailController, title: "Email",obsecureText: false,),
                    const SizedBox(height: 10,),
                    customTextField(controller: passwordController, title: "Password",obsecureText: true,),
                  ],
                )),
    
              const SizedBox(height: 50,),
              RoundButton(
                title: 'Sign up',
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
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                    }, 
                    child: const Text('Login'))
                ],
              )
    
              
            ],
          ),
        ),
      ),
    );
  }
}