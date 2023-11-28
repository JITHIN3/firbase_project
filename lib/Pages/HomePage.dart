import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbase_project/Custom/TodoCard.dart';
import 'package:firbase_project/Pages/AddTodo.dart';
import 'package:firbase_project/Pages/Signup.dart';
import 'package:firbase_project/Pages/profile.dart';
import 'package:firbase_project/Pages/view_data.dart';
import 'package:firbase_project/Service/Auth_Service.dart';
import 'package:flutter/material.dart';

  class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  AuthClass authClass = AuthClass();
  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection("Todo").snapshots();
  List<Select> selected = [];

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
          icon: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => Profile(),
                ),
              );
            },
            child: Icon(
              Icons.settings,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
      ]),
      body: StreamBuilder(
          stream: _stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  IconData? iconData;
                  Color? iconColor;
                  Map<String, dynamic> document =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  switch (document["category"]) {
                    case "Work":
                      iconData = Icons.work;
                      iconColor = Colors.red;
                      break;
                    case "WorkOut":
                      iconData = Icons.alarm;
                      iconColor = Colors.teal;
                      break;
                    case "Food":
                      iconData = Icons.local_grocery_store;
                      iconColor = Colors.blue;
                      break;
                    case "Design":
                      iconData = Icons.audiotrack;
                      iconColor = Colors.grey;
                      break;
                    case "Run":
                      iconData = Icons.run_circle_outlined;
                      iconColor = Colors.grey;
                      break;
                    default:
                      iconData = Icons.do_not_disturb_alt_outlined;
                      iconColor = Colors.red;
                  }
                  selected.add(
                    Select(
                        id: snapshot.data!.docs[index].id, checkValue: false),
                  );
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => ViewData(
                              document: document,
                              id: snapshot.data!.docs[index].id),
                        ),
                      );
                    },
                    child: TodoCard(
                      title: document["title"] == null
                          ? "No Title"
                          : document["title"],
                      check: selected[index].checkValue,
                      iconColor: iconColor,
                      iconBgColor: Colors.white,
                      iconData: iconData,
                      time: "10 AM",
                      index: index,
                      onChange: onchange,
                    ),
                  );
                });
          }),
    );
  }

  void onchange(int index) {
    selected[index].checkValue = selected[index].checkValue;
  }
}

class Select {
  String? id;
  bool? checkValue = false;

  Select({this.id, this.checkValue});
}
// Future use
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
