import 'dart:convert';

class PostsModel {
  final int userId;
  final int id;
  final String title;
  final String body;
  PostsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostsModel.fromMap(Map<String, dynamic> map) {
    return PostsModel(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostsModel.fromJson(String source) => PostsModel.fromMap(json.decode(source));
}