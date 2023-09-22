import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
              "Sign In",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            buttomItem(
                context, "lib/assets/google.png", "Continue With Google", 25),
            SizedBox(
              height: 15,
            ),
            buttomItem(
                context, "lib/assets/phone.png", "Continue WIth Phone", 30),
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
            textItem(context, "Email"),
            SizedBox(
              height: 15,
            ),
            textItem(context, "Password"),
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
                  "Don't Have An Account? ",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Forgot Password?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget colorButton(context) {
    return Container(
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
          child: Text(
        "Sign In",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }

  Widget buttomItem(context, String imagepath, String buttonName, double size) {
    return Container(
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
    );
  }

  Widget textItem(
    context,
    String labelText,
  ) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      width: double.infinity,
      height: 55,
      child: TextFormField(
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