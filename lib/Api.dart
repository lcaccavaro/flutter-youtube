import "package:http/http.dart" as http;
import "dart:convert";

import 'package:youtube/models/video.dart';

const CHAVE_YOUTUBE = "AIzaSyDYnLj-537HgzVSGlLr9PCv9Q8JvtLSQ8c";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";
const CHANNEL_ID = "UCwXdFgeE9KYzlDdR7TG9cMw";

class Api {

  Future<List<Video>> pesquisar(String query) async{
    http.Response response = await http.get(
      URL_BASE + "search"
      "?part=snippet"
      "&key=$CHAVE_YOUTUBE"
      "&type=video"
      "&maxResults=20"
      "&order=date"
      "&channelId=$CHANNEL_ID"
      "&q=$query"
    );

    if(response.statusCode == 200){
      
      Map<String,dynamic> jsonData = json.decode(response.body);
      //print("result:" + jsonData["items"][0].toString());
      /*
      for( var videos in jsonData["items"]){
        print("video: " + videos.toString());
      }
      */
      List<Video> videos = jsonData["items"].map<Video>(
        (map){
          return Video.fromJson(map);
        }
      ).toList();

      return videos;

    }
    else{
      
    }
  }

}
