import 'dart:convert'; // Required for jsonDecode
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:commentsproject/features/Comments/data/models/comment_model.dart';

abstract class CommentRemoteDataSource {
  Future<List<CommentModel>> getComments();
  Future<Unit> addComment(CommentModel comment);
}

class CommentRemoteDataSourceImpl implements CommentRemoteDataSource {
  final http.Client client;

  CommentRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CommentModel>> getComments() async {
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

    if (response.statusCode == 200) {
      // Decode the JSON response and map it to a list of CommentModel
      final List<dynamic> jsonData = jsonDecode(response.body) as List<dynamic>;
      final List<CommentModel> comments = jsonData.map((json) => CommentModel.fromJson(json)).toList();
      return comments;
    } else {
      throw Exception('Failed to load comments');
    }
  }

  @override
Future<Unit> addComment(CommentModel comment) async {
  final body = {
    "name": comment.name,
    "email": comment.email,
    "body": comment.body,
    "postId": 1
  };

  final response = await client.post(
    Uri.parse('https://jsonplaceholder.typicode.com/comments'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(body),
  );

  if (response.statusCode == 201) {
    return Future.value(unit);
  } else {
    throw Exception('Failed to add comment');
  }
}

}
