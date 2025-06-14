import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final int id;
  final int postId; // Changed from String to int
  final String name;
  final String email;
  final String body;

  const Comment({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  @override
  List<Object?> get props => [id, postId, name, email, body];
}
