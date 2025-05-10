import 'package:commentsproject/features/Comments/domain/entites/comment.dart';
import 'package:flutter/material.dart';


class CommentsList extends StatelessWidget {
  final List<Comment> comments;

  const CommentsList({Key? key, required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(comments[index].name),
          subtitle: Text(comments[index].email),
          leading: Text('${comments[index].id}'),
          isThreeLine: true,
        );
      },
    );
  }
}