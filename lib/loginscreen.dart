import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:practiceapp1/mainpage.dart';
import 'textfield.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'network.dart';



class loginscreen extends StatelessWidget {

  @override
 final GoogleSignIn googleSignIn =GoogleSignIn();
  final username =TextEditingController();
  final password = TextEditingController();
  login(){
    googleSignIn.signIn();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, 'mainpage');

                    },
                    child: Icon(Icons.arrow_forward,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Log in',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xfffefefe),
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: (){print('tapped');},
                child: Container(
                  decoration:
                  BoxDecoration(
                      border: Border.all(
                          color: Colors.white24
                      ),
                      color:  Color(0xff171717),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  width: 150,
                  height: 80,
                  child: Center(
                    child: Text("G",
                      style:
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Color(0xfffefefe),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              textfield(text: "E-mail",),
              textfield(text: "password",),
              Padding(
                padding: const EdgeInsets.only(top:50,left: 10,right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(begin:Alignment.centerLeft,end:Alignment.centerRight,colors:
                    <Color>[Color(0xffb816dd),
                      Color(0xffd128a6),
                    ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  width: double.infinity,
                  height: 60,
                  child: Center(
                    child: Text('Create Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
