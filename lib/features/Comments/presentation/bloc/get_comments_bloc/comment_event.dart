part of 'comment_bloc.dart';

sealed class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class GetCommentsEvent extends CommentEvent{
  
}


class RefreshCommentsEvent extends CommentEvent {
}