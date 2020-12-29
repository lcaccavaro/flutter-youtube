class Video{

  String id;
  String title;
  String description;
  String image;
  String channelId;
  String channelTitle;

  Video({this.id, this.title, this.description, this.image, this.channelId, this.channelTitle});
  
  /*
  //cada item gera 1 nova instância (ruim)
  static convertToJson(Map<String,dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      description: json["snippet"]["description"],
      image: json["snippet"]["thumbnails"]["high"]["url"],
      channelId: json["snippet"]["channelId"],
      channelTitle: json["snippet"]["channelTitle"] 
    );
  }
  */
  
  //apenas 1 instância (otimizado)
  factory Video.fromJson(Map<String,dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      description: json["snippet"]["description"],
      image: json["snippet"]["thumbnails"]["high"]["url"],
      channelId: json["snippet"]["channelId"],
      channelTitle: json["snippet"]["channelTitle"] 
      );
  }

}