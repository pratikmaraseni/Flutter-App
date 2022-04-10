import 'dart:convert';

Events eventsFromJson(String str) => Events.fromJson(json.decode(str));

String eventsToJson(Events data) => json.encode(data.toJson());

class Events {
  Events({
    required this.events,
  });

  List<Event> events;

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        events:
            List<Event>.from(json["response"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "response": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.groupIdId,
    required this.eventDate,
    required this.dateObj,
  });

  int id;
  String title;
  String description;
  String color;
  int groupIdId;
  DateTime eventDate;
  DateTime dateObj;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        color: json["color"],
        groupIdId: json["group_id_id"],
        eventDate: DateTime.parse(json["event_date"]),
        dateObj: DateTime.parse(json["date_obj"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "color": color,
        "group_id_id": groupIdId,
        "event_date": eventDate.toIso8601String(),
        "date_obj":
            "${dateObj.year.toString().padLeft(4, '0')}-${dateObj.month.toString().padLeft(2, '0')}-${dateObj.day.toString().padLeft(2, '0')}",
      };
}
