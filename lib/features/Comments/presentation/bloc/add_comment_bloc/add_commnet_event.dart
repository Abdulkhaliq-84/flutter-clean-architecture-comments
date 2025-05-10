part of 'add_commnet_bloc.dart';

sealed class AddCommnetEvent extends Equatable {
  const AddCommnetEvent();

  @override
  List<Object> get props => [];
}


class AddCommnetEventStarted extends AddCommnetEvent {
  final Comment comment;

  AddCommnetEventStarted({required this.comment});

  @override
  List<Object> get props => [comment];
}
