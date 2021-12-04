import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';
Future apidata() async{
  var data = await http.get(Uri.parse("https://api.aniapi.com/v1/anime/"),
  );
  var anidata = json.decode(data.body);
var anidatasort =json.decode(anidata)['data']['documents'];
}
class datareturn{
  late final  aniid;
  late final episdoes;
  late final description;
  late final imageurl;
  datareturn({
  required this.aniid,
  required this.description,
  required this.episdoes,
  required this.imageurl,


}
);
  factory datareturn.fromjson(Map<String,dynamic>json){
    return datareturn(aniid: json['anilist_id'], description: json['description'], episdoes: json['episodes_count'], imageurl: json['cover_image'],);
  }
  }
