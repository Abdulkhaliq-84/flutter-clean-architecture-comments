import 'package:commentsproject/features/Comments/data/models/comment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
abstract class CommentLocalDataSource {
  Future<void> cacheComment(List<CommentModel> comments); // Accepts a list of CommentModel
  Future<List<CommentModel>> getLastComment(); // Returns a list of CommentModel
}

class CommentLocalDataSourceImpl implements CommentLocalDataSource {
  final SharedPreferences sharedPreferences;

  CommentLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheComment(List<CommentModel> comments) {
    final List<String> jsonComments = comments.map((comment) => comment.toJson().toString()).toList();
    return sharedPreferences.setStringList('CACHED_COMMENT', jsonComments);
  }

  Future<List<CommentModel>> getLastComment() {
    final List<String>? jsonComments = sharedPreferences.getStringList('CACHED_COMMENT');
    if (jsonComments != null) {
      return Future.value(jsonComments.map((jsonComment) => CommentModel.fromJson(jsonComment as Map<String, dynamic>)).toList());
    } else {
      return Future.value([]);
    }
  }
  }
