// To parse this JSON data, do
//
//     final youtubeVideo = youtubeVideoFromJson(jsonString);

import 'dart:convert';

YoutubeVideos youtubeVideoFromJson(String str) =>
    YoutubeVideos.fromJson(json.decode(str));

String youtubeVideoToJson(YoutubeVideos data) => json.encode(data.toJson());

class YoutubeVideos {
  YoutubeVideos({
    required this.videos,
  });

  List<YoutubeVideo> videos;

  factory YoutubeVideos.fromJson(Map<String, dynamic> json) => YoutubeVideos(
        videos: List<YoutubeVideo>.from(
            json["response"].map((x) => YoutubeVideo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "response": List<dynamic>.from(videos.map((x) => x.toJson())),
      };
}

class YoutubeVideo {
  YoutubeVideo({
    required this.id,
    required this.url,
    required this.uploadedOn,
    required this.uploadedById,
    required this.groupIdId,
  });

  int id;
  String url;
  DateTime uploadedOn;
  int uploadedById;
  int groupIdId;

  factory YoutubeVideo.fromJson(Map<String, dynamic> json) => YoutubeVideo(
        id: json["id"],
        url: json["url"],
        uploadedOn: DateTime.parse(json["uploaded_on"]),
        uploadedById: json["uploaded_by_id"],
        groupIdId: json["group_id_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "uploaded_on": uploadedOn.toIso8601String(),
        "uploaded_by_id": uploadedById,
        "group_id_id": groupIdId,
      };
}
