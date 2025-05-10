import 'package:commentsproject/core/error/exceptions.dart';
import 'package:commentsproject/core/error/failure.dart';
import 'package:commentsproject/core/platform/network_info.dart';
import 'package:commentsproject/features/Comments/data/datasources/comment_local_data_source.dart';
import 'package:commentsproject/features/Comments/data/datasources/comment_remote_data_source.dart';
import 'package:commentsproject/features/Comments/data/models/comment_model.dart';
import 'package:commentsproject/features/Comments/domain/entites/comment.dart';
import 'package:commentsproject/features/Comments/domain/repositoreis/comments_repository.dart';
import 'package:dartz/dartz.dart';

class CommentsRepositoryImpl implements CommentsRepository {
  final CommentRemoteDataSource remoteDataSource;
  final CommentLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CommentsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Comment>>> getComments() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComments = await remoteDataSource.getComments();
        // Pass the list of CommentModel to the cacheComment method
        await localDataSource.cacheComment(remoteComments); 
        return Right(remoteComments);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localComments = await localDataSource.getLastComment();
        return Right(localComments);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
  
  @override
  Future<Either<Failure, Unit>> addComment(Comment comment) async {
    final CommentModel commentModel = CommentModel(
      id: comment.id,
      name: comment.name,
      email: comment.email,
      body: comment.body,
      postId: 1,
    );

    try {
      await remoteDataSource.addComment(commentModel);
      return Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
