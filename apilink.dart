import 'package:flutter/foundation.dart';
import 'package:http/http.dart ' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';


Future <dynamic>data() async {
 final  response = await http.get(Uri.parse('https://api.aniapi.com/v1/anime/'),
 );
 Map<String ,dynamic> anidata = jsonDecode(response.body);
 List<dynamic>adata = anidata["data"]["document"][0]["anilist_id"];
 print(adata);
}
class jsondata{
 final int aniid;
 final int episdoes;
 final String description;
 final String imageurl;
 jsondata({
  @required this.aniid,
  @required this.description,
  @required this.episdoes,
  @required this.imageurl,

 }
     );
 factory jsondata.fromJson(Map<String, dynamic> json){
  return jsondata(
   aniid: json['anilist_id'],
   description: json['description'],
   episdoes: json['episodes_count'],
   imageurl: json['cover_image'],
  );

 }
}
class Anicontainer extends StatefulWidget {
  @override
  _AnicontainerState createState() => _AnicontainerState();
}

class _AnicontainerState extends State<Anicontainer> {
  @override
  Future ani;
  void initState(){
   super.initState();
       ani=data();
  }
  Widget build(BuildContext context) {
    return Container();
  }
}
