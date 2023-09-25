import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
   TodoCard(
      {Key? key, this.title, this.iconData, this.index,this.iconColor,required this.onChange, this.time,this.check,this.iconBgColor})
      : super(key: key);
  final String? title;
  final IconData? iconData;
  final Color? iconColor;
  final String? time;
  final bool? check;
  final Color? iconBgColor;
  final Function onChange;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Theme(
            data: ThemeData(
              primarySwatch: Colors.blue,
              unselectedWidgetColor: Color(0xff5e616a),
            ),
            child: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                activeColor: Color(0xff6cf8a9),
                checkColor: Color(0xff0e3e26),
                value: check,
                onChanged: (bool? change) {
                  onChange(index);
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 75,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Color(0xff2a2e3d),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 33,
                      width: 36,
                      decoration: BoxDecoration(
                        color: iconBgColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        iconData,
                        color: iconColor,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Text(
                        title!,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      time!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
