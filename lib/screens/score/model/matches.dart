import 'dart:convert';

Matches matchesFromJson(String str) => Matches.fromJson(json.decode(str));

String matchesToJson(Matches data) => json.encode(data.toJson());

class Matches {
  Matches({
    required this.matches,
  });

  List<GMatch> matches;

  factory Matches.fromJson(Map<String, dynamic> json) => Matches(
        matches:
            List<GMatch>.from(json["response"].map((x) => GMatch.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "response": List<dynamic>.from(matches.map((x) => x.toJson())),
      };
}

class GMatch {
  GMatch({
    required this.id,
    required this.teamAId,
    required this.teamAName,
    required this.teamBId,
    required this.teamBName,
    required this.groupAId,
    required this.groupAName,
    required this.groupBId,
    required this.groupBName,
    required this.venueIdId,
    required this.dateTime,
    required this.uploadedById,
    required this.result,
    required this.teamScore,
    required this.opTeamScore,
  });

  int id;
  int teamAId;
  String teamAName;
  int teamBId;
  String teamBName;
  int groupAId;
  String groupAName;
  int groupBId;
  String groupBName;
  int venueIdId;
  DateTime dateTime;
  int uploadedById;
  bool result;
  dynamic teamScore;
  dynamic opTeamScore;

  factory GMatch.fromJson(Map<String, dynamic> json) => GMatch(
        id: json["id"],
        teamAId: json["team_a_id"],
        teamAName: json["team_a_name"],
        teamBId: json["team_b_id"],
        teamBName: json["team_b_name"],
        groupAId: json["group_a_id"],
        groupAName: json["group_a_name"],
        groupBId: json["group_b_id"],
        groupBName: json["group_b_name"],
        venueIdId: json["venue_id_id"],
        dateTime: DateTime.parse(json["date_time"]),
        uploadedById: json["uploaded_by_id"],
        result: json["result"],
        teamScore: json["team_score"],
        opTeamScore: json["op_team_score"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team_a_id": teamAId,
        "team_a_name": teamAName,
        "team_b_id": teamBId,
        "team_b_name": teamBName,
        "group_a_id": groupAId,
        "group_a_name": groupAName,
        "group_b_id": groupBId,
        "group_b_name": groupBName,
        "venue_id_id": venueIdId,
        "date_time": dateTime.toIso8601String(),
        "uploaded_by_id": uploadedById,
        "result": result,
        "team_score": teamScore,
        "op_team_score": opTeamScore,
      };
}
