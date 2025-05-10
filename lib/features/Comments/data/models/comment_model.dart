import 'package:commentsproject/features/Comments/domain/entites/comment.dart';

class CommentModel extends Comment {
  final int id;
  final int postId; // Changed postId to int
  final String name;
  final String email;
  final String body;

  CommentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
    required this.postId, // Ensure postId is int
  }) : super(id: id, postId: postId, name: name, email: email, body: body);

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'] as int, // id should be an int
      name: json['name'] as String, // expecting a string
      email: json['email'] as String, // expecting a string
      body: json['body'] as String,
      postId: json['postId'] as int, // postId should be an int
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'postId': postId,
      'name': name,
      'email': email,
      'body': body,
    };
  }
}
