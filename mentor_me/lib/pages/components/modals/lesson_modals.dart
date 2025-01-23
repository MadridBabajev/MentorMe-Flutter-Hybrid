import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentor_me/common/constants/colors.dart';
import 'package:mentor_me/services/mentor_me_api/models/lessons/response/lesson_details_result.dart';

class AddTagDialog extends ConsumerStatefulWidget {
  final String lessonId;
  final Future<void> Function(String tagName, String tagDescription) onSubmitted;

  const AddTagDialog({
    super.key,
    required this.lessonId,
    required this.onSubmitted,
  });

  @override
  ConsumerState<AddTagDialog> createState() => _AddTagDialogState();
}

class _AddTagDialogState extends ConsumerState<AddTagDialog> {
  final _formKey = GlobalKey<FormState>();
  final _tagNameController = TextEditingController();
  final _tagDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add New Tag"),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _tagNameController,
                decoration: const InputDecoration(labelText: "Tag name"),
                validator: (val) =>
                val == null || val.trim().isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _tagDescController,
                decoration:
                const InputDecoration(labelText: "Tag description"),
                maxLines: 2,
                validator: (val) =>
                val == null || val.trim().isEmpty ? "Required" : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        // Close button
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryTextColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Close"),
        ),
        // Add Tag button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkPrimaryColor,
            foregroundColor: AppColors.primaryTextColor,
          ),
          onPressed: _handleAddTag,
          child: const Text("Add Tag"),
        ),
      ],
    );
  }

  Future<void> _handleAddTag() async {
    if (!_formKey.currentState!.validate()) return;
    final tagName = _tagNameController.text.trim();
    final tagDesc = _tagDescController.text.trim();

    await widget.onSubmitted(tagName, tagDesc);
    if (mounted) Navigator.of(context).pop();
  }
}

class AddReviewDialog extends ConsumerStatefulWidget {
  final LessonDetailsResult lesson;
  final Future<void> Function(int rating, String comment) onSubmitted;

  const AddReviewDialog({
    super.key,
    required this.lesson,
    required this.onSubmitted,
  });

  @override
  ConsumerState<AddReviewDialog> createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends ConsumerState<AddReviewDialog> {
  final _formKey = GlobalKey<FormState>();
  final _commentController = TextEditingController();
  int _rating = 5; // default rating

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Leave a Review"),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Star picker
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final starNumber = index + 1;
                  return IconButton(
                    icon: Icon(
                      starNumber <= _rating ? Icons.star : Icons.star_border,
                      color: AppColors.accentColor,
                    ),
                    onPressed: () => setState(() => _rating = starNumber),
                  );
                }),
              ),
              TextFormField(
                controller: _commentController,
                decoration: const InputDecoration(labelText: "Comment"),
                maxLines: 3,
                validator: (val) =>
                val == null || val.trim().isEmpty ? "Required" : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        // Close button
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryTextColor, // make text black
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Close"),
        ),
        // Submit button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkPrimaryColor,
            foregroundColor: AppColors.primaryTextColor, // make text black
          ),
          onPressed: _handleSubmitReview,
          child: const Text("Submit"),
        ),
      ],
    );
  }

  Future<void> _handleSubmitReview() async {
    if (!_formKey.currentState!.validate()) return;
    final comment = _commentController.text.trim();
    await widget.onSubmitted(_rating, comment);

    if (mounted) Navigator.of(context).pop();
  }
}
