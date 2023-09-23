import 'package:firbase_project/Pages/HomePage.dart';
import 'package:firbase_project/Pages/Signin.dart';
import 'package:firbase_project/Pages/Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'Service/Auth_Service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  Widget currentPage = SignUpPage();
  AuthClass authClass = AuthClass();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }
  void checkLogin()async{

      String? token = await authClass.getToken();
     if(token!=null){
          setState(() {
            currentPage = HomePage();
          });

     }
  }
  // Future<String> getTokens() async {
  //   // Some logic to fetch the token
  //   String token =  authClass.getToken().toString();
  //   // Replace with actual logic to get the token
  //   if(token!=null){
  //     setState(() {
  //       currentPage = HomePage();
  //     });
  //
  //   }
  //   return token;
  // }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:currentPage,
    ); // void SignUp() async {
  }
}

//   try {
//     await firebaseAuth.createUserWithEmailAndPassword(
//         email:email.text, password:password.text);
//   } catch (e) {
//     print(e);
//   }
// }
// TextEditingController email = TextEditingController();
// TextEditingController password = TextEditingController();
