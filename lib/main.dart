import 'package:flutter/material.dart';
import 'login.dart';
import 'loginscreen.dart';
import 'mainpage.dart';
void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "signupscreen",
    routes: {
      'signupscreen': (context) => ui(),
      'loginscreen' : (context) => loginscreen(),
      'mainpage' : (context) => animecontainer(),
    } ,

  ),
  );
}