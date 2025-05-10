import 'package:commentsproject/features/Comments/domain/entites/comment.dart';
import 'package:commentsproject/features/Comments/domain/repositoreis/comments_repository.dart';
import 'package:commentsproject/features/Comments/domain/usecases/add_comment.dart';
import 'package:commentsproject/features/Comments/presentation/bloc/add_comment_bloc/add_commnet_bloc.dart';
import 'package:commentsproject/features/Comments/presentation/widgets/add_comment_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/injection_container.dart' as di;

class AddCommentPage extends StatelessWidget {
  const AddCommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<AddCommentBloc>(), // Initialize your AddCommentBloc here
      child: Scaffold(
        appBar: _buildAppBar(),
        body: const AddCommentForm(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Add Comment Page', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.purple,
    );
  }
}
