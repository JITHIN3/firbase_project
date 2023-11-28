import 'package:firbase_project/Pages/HomePage.dart';
import 'package:firbase_project/Pages/PhoneAuthPage.dart';
import 'package:firbase_project/Service/Auth_Service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'Signin.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}


class _SignUpPageState extends State<SignUpPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool circular = false;
  AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            buttomItem(
                context, "lib/assets/google.png", "Continue With Google", 25,
                () async {
              await authClass.googleSignIn(context);
            }),
            SizedBox(
              height: 15,
            ),
            buttomItem(
                context, "lib/assets/phone.png", "Continue WIth Phone", 30, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => PhoneAuthPage(),
                ),
              );
            }),
            SizedBox(
              height: 15,
            ),
            Text(
              "Or",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              height: 15,
            ),
            textItem(context, "Email", _emailController, false),
            SizedBox(
              height: 15,
            ),
            textItem(context, "Password", _passwordController, true),
            SizedBox(
              height: 30,
            ),
            colorButton(context),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have An Account? ",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (builder) => SignInPage()),
                        (route) => false);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget colorButton(context) {
    return InkWell(
      onTap: () async {
        setState(() {
          circular = true;
        });
        try {
          firebase_auth.UserCredential userCredential =
              await firebaseAuth.createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text);
          print(userCredential.user!.email);
          setState(() {
            circular = false;
          });

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => HomePage()),
              (route) => false);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Success")));
        } catch (e) {
          final snackbar = SnackBar(
            content: Text(
              e.toString(),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          setState(() {
            circular = false;
          });
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        height: 60,
        width: MediaQuery.of(context).size.width * 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color(0xfffd746c),
              Color(0xffff9868),
              Color(0xfffd746c),
            ],
          ),
        ),
        child: Center(
            child: circular
                ? CircularProgressIndicator()
                : Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
      ),
    );
  }

  Widget buttomItem(context, String imagepath, String buttonName, double size,
      VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width * 60,
        height: 60,
        child: Card(
          color: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(width: 1, color: Colors.grey)),
          elevation: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagepath,
                height: size,
                width: size,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                buttonName,
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textItem(context, String labelText, TextEditingController controller,
      bool obscureText) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      width: double.infinity,
      height: 55,
      child: TextFormField(
        style: TextStyle(color: Colors.white, fontSize: 17),
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white, fontSize: 17),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: Colors.amber),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
