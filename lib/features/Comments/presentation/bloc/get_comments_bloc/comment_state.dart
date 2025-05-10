part of 'comment_bloc.dart';

sealed class CommentState extends Equatable {
  const CommentState();
  
  @override
  List<Object> get props => [];
}

final class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  final List<Comment> comments;

  CommentLoaded({required this.comments});

  @override
  List<Object> get props => [comments];
}

class CommentError extends CommentState {
  final String message;

  CommentError({required this.message});

  @override
  List<Object> get props => [message];
}
