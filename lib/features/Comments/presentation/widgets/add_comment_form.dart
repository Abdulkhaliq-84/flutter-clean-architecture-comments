import 'package:commentsproject/features/Comments/domain/entites/comment.dart';
import 'package:commentsproject/features/Comments/domain/repositoreis/comments_repository.dart';
import 'package:commentsproject/features/Comments/domain/usecases/add_comment.dart';
import 'package:commentsproject/features/Comments/presentation/bloc/add_comment_bloc/add_commnet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCommentPage extends StatelessWidget {
  final Comment ? comment;

  const AddCommentPage({super.key, this.comment});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCommentBloc(addComment: AddComment(comment as CommentsRepository)), // Initialize your AddCommentBloc here
      child: const AddCommentForm(),
    );
  }
}

class AddCommentForm extends StatefulWidget {
  const AddCommentForm({super.key});

  @override
  State<AddCommentForm> createState() => _AddCommentFormState();
}

class _AddCommentFormState extends State<AddCommentForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _postIdController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when no longer needed
    _nameController.dispose();
    _emailController.dispose();
    _bodyController.dispose();
    _postIdController.dispose();
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCommentBloc, AddCommentState>(
      listener: (context, state) {
        if (state is AddCommentSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Comment added successfully!')),
          );
        } else if (state is AddCommentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to add comment: ${state.message}')),
          );
        }
      },
      builder: (context, state) {
        if (state is AddCommentLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                _buildTextField(
                  controller: _nameController,
                  label: 'Name',
                  inputType: TextInputType.text,
                ),
                _buildTextField(
                  controller: _emailController,
                  label: 'Email',
                  inputType: TextInputType.emailAddress,
                ),
                _buildTextField(
                  controller: _bodyController,
                  label: 'Body',
                  inputType: TextInputType.multiline,
                ),
                _buildTextField(
                  controller: _postIdController,
                  label: 'Post ID',
                  inputType: TextInputType.number,
                ),
                _buildTextField(
                  controller: _idController,
                  label: 'ID',
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final postId = int.tryParse(_postIdController.text) ?? 0;
                    final id = int.tryParse(_idController.text) ?? 0;

                    if (postId > 0 && id > 0) {
                      BlocProvider.of<AddCommentBloc>(context).add(
                        AddCommnetEventStarted(
                          comment: Comment(
                            name: _nameController.text,
                            email: _emailController.text,
                            body: _bodyController.text,
                            postId: postId,
                            id: id,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid Post ID or ID')),
                      );
                    }
                  },
                  child: const Text('Add Comment'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required TextInputType inputType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 100,
        width: 300,
        child: TextField(
          controller: controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
