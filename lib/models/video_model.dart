import 'package:videobite/models/summary_model.dart';

class VideoModel {
  bool status;
  String message;
  VideoData data;

  VideoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new VideoData.fromJson(json['data']) : null;
  }
}

class VideoData {
  int id;
  int userId;
  String title;
  String link;
  int flag;
  int activeSummary;
  String createdAt;
  Summary summary;
  List<Timestamp> timestamps = [];
  List<Keyword> keywords = [];
  VideoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    link = json['link'];
    flag = json['flag'];
    activeSummary = json['active_summary'];
    createdAt = json['created_at'];
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    if (json['timestamps'] != null)
      json['timestamps'].forEach((element) {
        timestamps.add(Timestamp.fromJson(element));
      });
    if (json['keywords'] != null)
      json['keywords'].forEach((element) {
        keywords.add(Keyword.fromJson(element));
      });
  }
}

class Timestamp {
  int id;
  int videoId;
  String startTime;
  String endTime;
  String description;
  String createdAt;

  Timestamp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoId = json['video_id'];
    startTime = (double.parse(json['start_time']) / 60)
        .toStringAsPrecision(3)
        .replaceAll(".", ":");
    endTime = (double.parse(json['end_time']) / 60)
        .toStringAsPrecision(3)
        .replaceAll(".", ":");
    description = json['description'];
    createdAt = json['created_at'];
  }
}

class Keyword {
  int id;
  int videoId;
  String keyword;
  String createdAt;

  Keyword.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoId = json['video_id'];
    keyword = json['keyword'];
    createdAt = json['created_at'];
  }
}
