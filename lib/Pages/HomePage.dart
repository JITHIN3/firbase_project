import 'package:firbase_project/Custom/TodoCard.dart';
import 'package:firbase_project/Pages/AddTodo.dart';
import 'package:firbase_project/Pages/Signup.dart';
import 'package:firbase_project/Service/Auth_Service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Today's Schedule",
          style: TextStyle(
              fontSize: 34, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage("lib/assets/profile.jpg"),
          ),
          SizedBox(
            width: 20,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text(
                "Moday 21",
                style: TextStyle(
                    fontSize: 33,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          BottomNavigationBar(backgroundColor: Colors.black87, items: [
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.home,
            size: 32,
            color: Colors.white,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => AddTodoPage(),
                ),
              );
            },
            child: Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.indigoAccent, Colors.purple]),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.add,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.settings,
            size: 32,
            color: Colors.white,
          ),
        ),
      ]),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(children: [
            TodoCard(
              title: "Wake Up Bro",
              check: true,
              iconColor: Colors.red,
              iconBgColor: Colors.white,
              iconData: Icons.alarm,
              time: "10 AM",
            ),
            SizedBox(
              height: 10,
            ),
            TodoCard(
              title: "Buy Some Food",
              check: false,
              iconColor: Colors.white,
              iconBgColor: Color(0xffff19733),
              iconData: Icons.local_grocery_store,
              time: "12 PM",
            ),
            SizedBox(
              height: 10,
            ),
            TodoCard(
              title: "Testing Something",
              check: true,
              iconColor: Colors.white,
              iconBgColor: Color(0xffd3c2b9),
              iconData: Icons.audiotrack,
              time: "2 PM",
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }

}
//Future use
// IconButton(
// onPressed: () async {
// await authClass.signOut(context);
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(
// builder: (builder) => SignUpPage(),
// ),
// (route) => false);
// },
// icon: Icon(Icons.logout),
// )
