import 'package:flutter/foundation.dart';
import 'package:http/http.dart ' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'api.dart';
void main(){runApp(MaterialApp());}

class animecontainer extends StatefulWidget {

  @override
  _animecontainerState createState() => _animecontainerState();
}

class _animecontainerState extends State<animecontainer> {
@override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   apidata();
  // }
  @override
  late Future<List<animedata>> shows=getdata();
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
            return Center(child: Text('Something went wrong :(${snapshot.error}'));
          }
          return CircularProgressIndicator();

        },
          future: shows,
        ),
      ),
    );
  }
}

class animedata{
  final int aniid;
  final int episdoes;
  String description;
  String imageurl;
  animedata({
   required this.aniid,
    required this.description,
    required this.episdoes,
    required this.imageurl,
  }

      );
  factory animedata.fromJson(Map<String,dynamic> json){
    return animedata(
      aniid: json['anilist_id'],
      description: json['description'],
      episdoes: json['episodes_count'],
      imageurl: json['cover_image'],
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
 // Map<String, dynamic> responsedata= json.decode(response.body);
 // List<dynamic> map = responsedata["animedata"];
final responsedata = response.body ;
  //print(response.body);
 // print(response.statusCode);
  if(response.statusCode==200){
    Map<String ,dynamic> anidata = jsonDecode(response.body);
    List<dynamic> adata = anidata["data"]["document"][1];
    print(adata);
    final  docs  = jsonDecode(responsedata)['data']['documents'] as List;
   //var id = jsonDecode(responsedata)['data']['document'][0]["anilist_id"];
   //print(id);
    return docs.map((Animedata) => animedata.fromJson(Animedata)).toList();
    // return  docs.map((animedata) => animedata.fromJson(animedata)).toList();
  }
  else {
    throw Exception('failed to load');
  }


}
