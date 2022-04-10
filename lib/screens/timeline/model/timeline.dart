import 'dart:convert';

Timelines timelinesFromJson(String str) => Timelines.fromJson(json.decode(str));

String timelinesToJson(Timelines data) => json.encode(data.toJson());

class Timelines {
  Timelines({
    required this.timelines,
  });

  List<Timeline> timelines;

  factory Timelines.fromJson(Map<String, dynamic> json) => Timelines(
        timelines: List<Timeline>.from(
            json["response"].map((x) => Timeline.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "response": List<dynamic>.from(timelines.map((x) => x.toJson())),
      };
}

class Timeline {
  Timeline({
    required this.id,
    required this.message,
    required this.file,
    required this.commentCount,
    required this.likeCount,
    required this.uploadedById,
    required this.groupIdId,
    required this.createdOn,
    required this.groupName,
    required this.dateObj,
  });

  int id;
  String message;
  String file;
  int commentCount;
  int likeCount;
  int uploadedById;
  int groupIdId;
  DateTime createdOn;
  String groupName;
  DateTime dateObj;

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        id: json["id"],
        message: json["message"],
        file: json["file"],
        commentCount: json["comment_count"],
        likeCount: json["like_count"],
        uploadedById: json["uploaded_by_id"],
        groupIdId: json["group_id_id"],
        createdOn: DateTime.parse(json["created_on"]),
        groupName: json["group_name"],
        dateObj: DateTime.parse(json["date_obj"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "file": file,
        "comment_count": commentCount,
        "like_count": likeCount,
        "uploaded_by_id": uploadedById,
        "group_id_id": groupIdId,
        "created_on": createdOn.toIso8601String(),
        "group_name": groupName,
        "date_obj":
            "${dateObj.year.toString().padLeft(4, '0')}-${dateObj.month.toString().padLeft(2, '0')}-${dateObj.day.toString().padLeft(2, '0')}",
      };
}
