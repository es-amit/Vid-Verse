
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vidverse/screens/authentication/verify_code.dart';
import 'package:vidverse/utils/utilities.dart';
import 'package:vidverse/widgets/round_button.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        child: Column(
          children: [
            const Text('Sign Up with Phone Number',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
            const SizedBox(height: 25,),
            SvgPicture.asset('assets/verification.svg',
            height: 300,
            width: 270,),
            const SizedBox(height: 50,),
            customTextField(controller: phoneController, title: "Phone Number", obsecureText: false,iconName: Icons.phone,),
            const SizedBox(height: 40,),
            RoundButton(
              loading: loading,
              title: "Login", 
              onTap: (){
              setState(() {
                loading = true;
              });

              auth.verifyPhoneNumber(
                phoneNumber: phoneController.text,
                verificationCompleted: (_){
                  setState(() {
                    loading = false;
                  });

                }, 
                verificationFailed: (e){
                  setState(() {
                    loading = false;
                  });
                  Utils().toastMessage(e.toString());
                }, 
                codeSent: (String verificationId ,int? token){
                  setState(() {
                    loading = false;
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyCodeScreen(verificationId: verificationId,)));
                }, 
                codeAutoRetrievalTimeout:(e){
                  setState(() {
                    loading = false;
                  });
                  Utils().toastMessage(e.toString());
                } );

            })
          ]),
      ),
    );
  }
}