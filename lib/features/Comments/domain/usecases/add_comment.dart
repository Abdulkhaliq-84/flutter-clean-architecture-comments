import 'package:commentsproject/core/error/failure.dart';
import 'package:commentsproject/features/Comments/domain/entites/comment.dart';
import 'package:commentsproject/features/Comments/domain/repositoreis/comments_repository.dart';
import 'package:dartz/dartz.dart';

class AddComment{
  final CommentsRepository repository;
  AddComment(this.repository);

  Future<Either<Failure, Unit>> call(Comment comment) async {
    return await repository.addComment(comment);
  }
}
