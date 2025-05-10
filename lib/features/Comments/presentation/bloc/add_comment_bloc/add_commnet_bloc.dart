import 'package:bloc/bloc.dart';
import 'package:commentsproject/core/error/failure.dart';
import 'package:commentsproject/features/Comments/domain/entites/comment.dart';
import 'package:commentsproject/features/Comments/domain/usecases/add_comment.dart';
import 'package:equatable/equatable.dart';

part 'add_commnet_event.dart';
part 'add_commnet_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String EMPTY_CACHE_FAILURE_MESSAGE = 'Empty Cache Failure';
const String OFFLINE_FAILURE_MESSAGE = 'Offline Failure';

class AddCommentBloc extends Bloc<AddCommnetEvent, AddCommentState> {
  final AddComment addComment;
  AddCommentBloc ({required this.addComment}) : super(AddCommentInitial()) {
    on<AddCommnetEvent>((event, emit) async {
      if (event is AddCommnetEventStarted) {
        emit(AddCommentLoading());
       final failureOrDoneMessage = await addComment(event.comment);

        failureOrDoneMessage.fold(
          (failure) => emit(AddCommnetError(message: _failureToMessage(failure))),
          (doneMessage) => emit(AddCommenttLoaded(message: "Comment Added Successfully")),
        );
      }

    });
  }

  String _failureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      default:
        return "Unexpected error, please try again";
    }
  }

}
