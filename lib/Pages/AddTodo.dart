import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController _titileController = TextEditingController();
  TextEditingController _descreptionController = TextEditingController();
  String type = "";
  String category = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1d1e26), Color(0xff252041)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    CupertinoIcons.arrow_left,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 33,
                            letterSpacing: 5),
                      ),
                      Text(
                        "New Todo",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 33,
                            letterSpacing: 3),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      label("Task Title"),
                      SizedBox(height: 12),
                      titile(),
                      SizedBox(
                        height: 30,
                      ),
                      label("Task Type"),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          taskSelect("Important", 0xff2664fa),
                          SizedBox(
                            width: 20,
                          ),
                          taskSelect("Planned", 0xff2bc8d9)
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      label("Descreption"),
                      SizedBox(
                        height: 12,
                      ),
                      descreption(),
                      SizedBox(
                        height: 25,
                      ),
                      label("Category"),
                      SizedBox(
                        height: 12,
                      ),
                      Wrap(
                        runSpacing: 10,
                        children: [
                          categorySelect("Food", 0xffff6d6e),
                          SizedBox(
                            width: 20,
                          ),
                          categorySelect("WorkOut", 0xfff29732),
                          SizedBox(
                            width: 20,
                          ),
                          categorySelect("Work", 0xff6557ff),
                          SizedBox(
                            width: 20,
                          ),
                          categorySelect("Design", 0xff234ebd),
                          SizedBox(
                            width: 20,
                          ),
                          categorySelect("Run", 0xff2bc8d9),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      button(),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget button() {
    return InkWell(
      onTap: () {
        FirebaseFirestore.instance.collection("Todo").add({
          "title": _titileController.text,
          "task": type,
          "descreption": _descreptionController.text,
          "category": category
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Successfully Created"),
            backgroundColor: Colors.teal,

          ),
        );
        Navigator.pop(context);
      },
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.indigoAccent, Colors.purple]),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "Add Todo",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget descreption() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Color(0xff212e3d), borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        controller: _descreptionController,
        maxLines: null,
        style: TextStyle(color: Colors.white, fontSize: 17),
        decoration: InputDecoration(
          hintText: "task title",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 20, right: 20),
        ),
      ),
    );
  }

  Widget taskSelect(String label, int color) {
    return InkWell(
      onTap: () {
        setState(() {
          type = label;
        });
      },
      child: Chip(
        backgroundColor: type == label ? Colors.white : Color(color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(
          label,
          style: TextStyle(
            color: type == label ? Colors.black : Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        labelPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 2.8),
        side: BorderSide.none,
      ),
    );
  }

  Widget categorySelect(String label, int color) {
    return InkWell(
      onTap: () {
        setState(() {
          category = label;
        });
      },
      child: Chip(
        backgroundColor: category == label ? Colors.white : Color(color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(
          label,
          style: TextStyle(
            color: category == label ? Colors.black : Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        labelPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 2.8),
        side: BorderSide.none,
      ),
    );
  }

  Widget titile() {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Color(0xff212e3d), borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        controller: _titileController,
        style: TextStyle(color: Colors.white, fontSize: 17),
        decoration: InputDecoration(
          hintText: "task title",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 20, right: 20),
        ),
      ),
    );
  }

  Widget label(String label) {
    return Text(
      label,
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16.5,
          letterSpacing: 0.3),
    );
  }
}
