
import 'package:safaqat/safaqat/data/models/posts/post_body.dart';

class EditPostParams {
  EditPostParams({
    required this.postId,
    required this.body,
  });

  final String? postId;
  final PostBody body;
}
