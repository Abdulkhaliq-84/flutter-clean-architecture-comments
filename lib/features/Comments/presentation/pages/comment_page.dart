import 'package:commentsproject/features/Comments/presentation/bloc/get_comments_bloc/comment_bloc.dart';
import 'package:commentsproject/features/Comments/presentation/widgets/add_comment_button.dart';
import 'package:commentsproject/features/Comments/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: BlocBuilder<CommentBloc, CommentState>(
        builder: (context, state) {
          if (state is CommentLoading) {
            return const LoadingWidget();
          } else if (state is CommentLoaded) {
            return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: ListView.builder(
                itemCount: state.comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.comments[index].name),
                    subtitle: Text(state.comments[index].email),
                    leading: Text(state.comments[index].id.toString()),
                  );
                },
              ),
            );
          } else if (state is CommentError) {
            return const Center(child: Text('Failed to load comments'));
          }
          return Container();
        },
      ),
      floatingActionButton: AddCommentButton(),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Comments Page', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.purple,
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<CommentBloc>(context).add(RefreshCommentsEvent());
  }
}
