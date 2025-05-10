import 'package:commentsproject/features/Comments/presentation/bloc/add_comment_bloc/add_commnet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;
import 'features/Comments/presentation/pages/comment_page.dart';
import 'package:commentsproject/features/Comments/presentation/bloc/get_comments_bloc/comment_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CommentBloc>(
            create: (_) => di.sl<CommentBloc>()..add(GetCommentsEvent()),
          ),
          
          BlocProvider<AddCommentBloc>(
            create: (_) => di.sl<AddCommentBloc>()
          ),
        ],
        child: const CommentPage(),
      ),
    );
  }
}

