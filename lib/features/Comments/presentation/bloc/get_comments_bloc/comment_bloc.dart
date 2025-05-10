import 'package:bloc/bloc.dart';
import 'package:commentsproject/core/error/failure.dart';
import 'package:commentsproject/features/Comments/domain/entites/comment.dart';
import 'package:commentsproject/features/Comments/domain/usecases/get_comments.dart';
import 'package:equatable/equatable.dart';

part 'comment_event.dart';
part 'comment_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String EMPTY_CACHE_FAILURE_MESSAGE = 'Empty Cache Failure';
const String OFFLINE_FAILURE_MESSAGE = 'Offline Failure';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final GetComments getComments;

  CommentBloc({required this.getComments}) : super(CommentInitial()) {
    on<GetCommentsEvent>(_onGetCommentsEvent);
    on<RefreshCommentsEvent>(_onRefreshCommentsEvent);
  }

  Future<void> _onGetCommentsEvent(GetCommentsEvent event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    final failureOrComments = await getComments();

    failureOrComments.fold(
      (failure) => emit(CommentError(message: _failureToMessage(failure))),
      (comments) => emit(CommentLoaded(comments: comments)),
    );
  }

  Future<void> _onRefreshCommentsEvent(RefreshCommentsEvent event, Emitter<CommentState> emit) async {
    final failureOrComments = await getComments();

    failureOrComments.fold(
      (failure) => emit(CommentError(message: _failureToMessage(failure))),
      (comments) => emit(CommentLoaded(comments: comments)),
    );
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
