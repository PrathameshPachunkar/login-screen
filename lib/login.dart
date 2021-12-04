import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'textfield.dart';
import 'loginscreen.dart';
import 'network.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as dart;

class ui extends StatefulWidget {
  @override
  _uiState createState() => _uiState();

}


final username = TextEditingController();
final password = TextEditingController();

class _uiState extends State<ui> {
  @override
  initstate (){
    super.initState();
    getdata();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign In',
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
                onTap: (){

                  print('tapped');
                  },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white24),
                      color: Color(0xff171717),
                      borderRadius: BorderRadius.circular(20)),
                  width: 150,
                  height: 80,
                  child: Center(
                    child: Text(
                      "G",
                      style: TextStyle(
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
              textfield(
                text: "name",
              ),
              textfield(
                text: "E-mail",
              ),
              textfield(
                text: "password",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Color(0xffb816dd),
                        Color(0xffd128a6),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: double.infinity,
                  height: 60,
                  child: Center(
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an Account?',
                    style: TextStyle(
                      color: Colors.white38,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => loginscreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
