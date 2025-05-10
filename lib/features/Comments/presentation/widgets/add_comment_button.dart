import 'package:commentsproject/features/Comments/presentation/pages/add_comment_page.dart';
import 'package:flutter/material.dart';

class AddCommentButton extends StatefulWidget {
  const AddCommentButton({super.key});

  @override
  State<AddCommentButton> createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends State<AddCommentButton> {
  void onPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCommentPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(onPressed: onPressed, child: const Icon(Icons.add)),
    );
  }
}