import 'package:flutter/foundation.dart';
import 'package:http/http.dart ' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';


class animecontainer extends StatefulWidget {

  @override
  _animecontainerState createState() => _animecontainerState();
}

class _animecontainerState extends State<animecontainer> {
 late Future<List<animedata>> shows;
  @override
  void initstate(){
    super.initState();
    shows = getdata();
  }

  Widget build(BuildContext context) {
    return Scaffold(
body: Center(
  child: FutureBuilder(builder:(BuilderContext , AsyncSnapshot<List<animedata>> snapshot){
   if(snapshot.hasData){
     return Center(
       child: Column(
         children: [
           ListView.builder(
               itemCount: snapshot.data!.length,
               itemBuilder: (context , index){
                 return ListTile(
                   leading: CircleAvatar(
                     backgroundImage: NetworkImage( '${snapshot.data?[index].imageurl}'),
                   ),
                 );
               }),
         ],
       ),
     );
   }
   else if(snapshot.hasError){
     return Center(child: Text('Something went wrong :('));
   }
   return CircularProgressIndicator();

  },
  future: shows,
  ),
),
    );
  }
}
Future <List<animedata>> getdata() async {
  final response = await http.get(
      Uri.parse('https://api.aniapi.com/v1/anime/'),
      headers: {
        HttpHeaders.authorizationHeader: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM1OSIsIm5iZiI6MTYzMjgzMDg4NCwiZXhwIjoxNjM1NDIyODg0LCJpYXQiOjE2MzI4MzA4ODR9.tsayfv5cwImVAwurku5wBaHGe2lWV4gWAg1iaDq1qEQ',

      }
  );
  String responsedata = response.body;
  print(response.body);
  print(response.statusCode);
  if(response.statusCode==200){
    var docs = jsonDecode(responsedata);
    var id = docs["data"]["document"][0]["anilist_id"];
    print(response.body);
    print(id);

    return docs.map((Animedata) => animedata.fromJson(Animedata)).toList();
   // return  docs.map((animedata) => animedata.fromJson(animedata)).toList();
  }
  else {
    throw Exception('failed to load');
  }

}
class animedata{
  final  aniid;
  final episdoes;
  final description;
  final imageurl;
  animedata({
    required this.aniid,
    required this.description,
    required this.episdoes,
    required this.imageurl,

  }
      );
  factory animedata.fromJson(Map<String, dynamic> json){
    return animedata(
      aniid: json['anilist_id'],
      description: json['description'],
      episdoes: json['episodes_count'],
      imageurl: json['cover_image'],
    );
  }
}

