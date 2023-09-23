import 'package:firbase_project/Pages/Signup.dart';
import 'package:firbase_project/Service/Auth_Service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
      IconButton(
        onPressed: () async {
          await authClass.signOut(context);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (builder) => SignUpPage(),
              ),
              (route) => false);
        },
        icon: Icon(Icons.logout),
      )
    ]));
  }
}
