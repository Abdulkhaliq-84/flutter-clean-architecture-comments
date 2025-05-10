import 'package:commentsproject/core/platform/network_info.dart';
import 'package:commentsproject/features/Comments/data/datasources/comment_local_data_source.dart';
import 'package:commentsproject/features/Comments/data/datasources/comment_remote_data_source.dart';
import 'package:commentsproject/features/Comments/data/repositories/comments_repoistory_impl.dart';
import 'package:commentsproject/features/Comments/domain/repositoreis/comments_repository.dart';
import 'package:commentsproject/features/Comments/domain/usecases/add_comment.dart';
import 'package:commentsproject/features/Comments/domain/usecases/get_comments.dart';
import 'package:commentsproject/features/Comments/presentation/bloc/add_comment_bloc/add_commnet_bloc.dart';
import 'package:commentsproject/features/Comments/presentation/bloc/get_comments_bloc/comment_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  try {
    // Bloc
    sl.registerFactory(() => CommentBloc(getComments: sl()));
    sl.registerFactory(() => AddCommentBloc(addComment: sl()));

    // Use cases
    sl.registerLazySingleton(() => GetComments(sl()));
    sl.registerLazySingleton(() => AddComment(sl()));

    // Repository
    sl.registerLazySingleton<CommentsRepository>(() => CommentsRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ));

   

    // Data sources
    sl.registerLazySingleton<CommentRemoteDataSource>(() => CommentRemoteDataSourceImpl(client: sl()));
    sl.registerLazySingleton<CommentLocalDataSource>(() => CommentLocalDataSourceImpl(sharedPreferences: sl()));
     sl.registerLazySingleton(() => InternetConnectionChecker());

  // Register NetworkInfoImpl
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));


    // External dependencies
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton(() => http.Client());
  } catch (e) {
    print('Error during DI setup: $e');
  }
}
