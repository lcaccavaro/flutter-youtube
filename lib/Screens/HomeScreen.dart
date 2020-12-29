import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/models/video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class HomeScreen extends StatefulWidget {
  @override
  
  String seachResult;
  HomeScreen( this.seachResult );
  
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  _listVideos( String search ){
    
    Future<List<Video>> videos;

    Api api = Api();
    videos = api.pesquisar( search );

    return videos;

  }

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder<List<Video>>(
      future: _listVideos(widget.seachResult),
      builder: (context, snapshot){
        switch( snapshot.connectionState ){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData){
              
              List<Video> videos = snapshot.data;

              return ListView.separated(
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      FlutterYoutube.playYoutubeVideoById(
                        apiKey: CHAVE_YOUTUBE,
                        videoId: videos[index].id,
                        autoPlay: true,
                        fullScreen: true
                      );
                    },
                    child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(videos[index].image) 
                                )
                            ),
                          ),
                          ListTile(
                            title: Text( videos[index].title ),
                            subtitle: Text( videos[index].channelTitle ),
                          )
                        ],
                      ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 2,
                  color: Colors.grey,
                ),
                itemCount: snapshot.data.length

              );

            }
            else{
              return Center(
                child: Text("Erro ao carregar os dados, tente novamente mais tarde.ß",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 32  
                        )
                      )
                );
            }
            break;
        
        }
        
      },
    );
}
}