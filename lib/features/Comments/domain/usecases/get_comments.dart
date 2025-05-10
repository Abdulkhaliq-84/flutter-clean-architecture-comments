import 'package:commentsproject/core/error/failure.dart';
import 'package:commentsproject/features/Comments/domain/entites/comment.dart';
import 'package:commentsproject/features/Comments/domain/repositoreis/comments_repository.dart';
import 'package:dartz/dartz.dart';


class GetComments {
  final CommentsRepository repository;
  GetComments(this.repository);

  Future<Either<Failure, List<Comment>>> call() async {
    return await repository.getComments();
  }

}