import 'dart:convert';

class Feed {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final String uploadTime;
  final String views;
  final String author;
  final String videoUrl;
  final String description;
  final String subscriber;
  final bool isLive;

  Feed({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.uploadTime,
    required this.views,
    required this.author,
    required this.videoUrl,
    required this.description,
    required this.subscriber,
    required this.isLive,
  });

  factory Feed.fromJson(String str) => Feed.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Feed.fromMap(Map<String, dynamic> json) => Feed(
        id: json["id"],
        title: json["title"],
        thumbnailUrl: json["thumbnailUrl"],
        duration: json["duration"],
        uploadTime: json["uploadTime"],
        views: json["views"],
        author: json["author"],
        videoUrl: json["videoUrl"],
        description: json["description"],
        subscriber: json["subscriber"],
        isLive: json["isLive"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "thumbnailUrl": thumbnailUrl,
        "duration": duration,
        "uploadTime": uploadTime,
        "views": views,
        "author": author,
        "videoUrl": videoUrl,
        "description": description,
        "subscriber": subscriber,
        "isLive": isLive,
      };
}
