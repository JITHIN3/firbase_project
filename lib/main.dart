import 'package:firbase_project/Pages/Signin.dart';
import 'package:firbase_project/Pages/Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);




  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  // void SignUp() async {
  //   try {
  //     await firebaseAuth.createUserWithEmailAndPassword(
  //         email:email.text, password:password.text);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  // TextEditingController email = TextEditingController();
  // TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home:SignInPage(),
    );
  }
}

