
import 'package:commentsproject/core/error/failure.dart';
import 'package:commentsproject/features/Comments/domain/entites/comment.dart';
import 'package:dartz/dartz.dart';


abstract class CommentsRepository {
  Future<Either<Failure, List<Comment>>> getComments();
  Future<Either<Failure, Unit>> addComment(Comment comment);
}