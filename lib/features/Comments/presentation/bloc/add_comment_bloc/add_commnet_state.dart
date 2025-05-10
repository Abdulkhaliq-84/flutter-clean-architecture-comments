part of 'add_commnet_bloc.dart';

sealed class AddCommentState extends Equatable {
  const AddCommentState();
  
  @override
  List<Object> get props => [];
}

final class AddCommentInitial extends AddCommentState {}

class AddCommentLoading extends AddCommentState {}

class AddCommenttLoaded extends AddCommentState {
 final String message;

  AddCommenttLoaded({required this.message});

  @override
  List<Object> get props => [message];
}

class AddCommnetError extends AddCommentState {
  final String message;

  AddCommnetError({required this.message});

  @override
  List<Object> get props => [message];
}

class AddCommentSuccess extends AddCommentState {
  final String message;

  AddCommentSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class AddCommentFailure extends AddCommentState {
  final String message;

  AddCommentFailure({required this.message});

  @override
  List<Object> get props => [message];
}

