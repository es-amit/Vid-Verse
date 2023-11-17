import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:vidverse/screens/home.dart';
import 'package:vidverse/utils/utilities.dart';
import 'package:vidverse/widgets/round_button.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationId;
  const VerifyCodeScreen({super.key, required this.verificationId});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final verifyController = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool loading = false;
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 199, 176, 236),
      border: Border.all(color:  const Color.fromARGB(255, 113, 68, 190)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text("OTP Verifcation",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),),
          SvgPicture.asset('assets/OTP.svg',
          height: 300,
          width: 270,),
          const SizedBox(height: 30,),
          Pinput(
            length: 6,
            controller: verifyController,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                color: const Color.fromARGB(255, 192, 239, 194),
                border: Border.all(color: const Color.fromARGB(255, 42, 127, 47))
              )
            ),
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
          ),
          const SizedBox(height: 30,),
          RoundButton(
              loading: loading,
              title: 'Verify',
              onTap: () async {
                setState(() {
                  loading = true;
                });
                final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: verifyController.text.toString());
                try {
                  await auth.signInWithCredential(credential);
    
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()));
                } catch (e) {
                  setState(() {
                    loading = false;
                  });
                  Utils().toastMessage(e.toString());
                }
              })
        ]),
      ),
    );
  }
}
