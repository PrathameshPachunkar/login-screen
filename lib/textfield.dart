import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  final String text;
  textfield({required this.text});

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30,right: 10,left: 10),
      child: TextField(
        decoration: InputDecoration(

          label: Text(text,style: TextStyle(
            color: Colors.white,

          ),
          ),
          filled: true,
          fillColor: Colors.white12,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15),),

          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20),),
            borderSide: BorderSide(
              color: Color(0xff9b2981),
            ),

          ),
        ),
      ),
    );
  }
}
