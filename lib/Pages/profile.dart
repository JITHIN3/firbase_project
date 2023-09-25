import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker _picker = ImagePicker();
  XFile?  image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff1d1e26), Color(0xff252041)],
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: getImage(),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button(),
                IconButton(
                    onPressed: () async {
                      image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        image = image;
                      });
                    },
                    icon: Icon(
                      Icons.add_a_photo_rounded,
                      color: Colors.teal,
                      size: 30,
                    ))
              ],
            )
          ]),
        ),
      ),
    );
  }
  ImageProvider getImage(){
    if(image != null){
      return FileImage(File(image!.path));
    }
    return AssetImage("lib/assets/profile.jpg");
  }

  Widget button() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.indigoAccent, Colors.purple]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            "Upload",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
