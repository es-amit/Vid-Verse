import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const RoundButton({super.key,required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white
          ),),
        ),
    
      ),
    );
  }
}


// ignore: must_be_immutable, camel_case_types
class customTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String title="";
  bool obsecureText;
  customTextField({super.key,required this.controller,required this.title,required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if(value!.isEmpty && title == "Password"){
          return "Please fill Password field";
        }
        if(value.isEmpty && title == "Email"){
          return "Please fill Email field";
        }
        return null;
        
      },
      keyboardType: obsecureText? TextInputType.text : TextInputType.emailAddress,
      obscureText: obsecureText,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: title == "Password"? const Icon(Icons.lock) : const Icon(Icons.email),
                labelText: title,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue,width: 2)
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade600,width: 2)
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.redAccent,width: 2)
                ),
              ),
    );
  }
}


class PhoneAuth extends StatelessWidget {
  final String imagepath,buttonName;
  final double size;
  final VoidCallback onTap;
  const PhoneAuth({super.key,required this.buttonName,required this.imagepath,required this.size,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.grey)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(imagepath,
              height: size,
              width: size,),
              const SizedBox(width: 15,),
              Text(buttonName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17.0
                ),)
              ],
            ),
        ),
      ),
    );
  }
}