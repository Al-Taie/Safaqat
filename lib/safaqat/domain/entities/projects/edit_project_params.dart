
import 'package:safaqat/safaqat/data/models/projects/project_body.dart';

class EditProjectParams {
  EditProjectParams({
    required this.projectId,
    required this.body,
  });

  final String? projectId;
  final ProjectBody body;
}
