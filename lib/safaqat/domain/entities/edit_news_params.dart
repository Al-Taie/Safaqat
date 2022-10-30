import 'package:safaqat/safaqat/data/models/news/edit/edit_news_body.dart';

class EditNewsParams {
  EditNewsParams({
    required this.newsId,
    required this.body,
  });

  final String newsId;
  final EditNewsBody body;
}
