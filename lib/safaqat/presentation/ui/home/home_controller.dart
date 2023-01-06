import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/widget_extension.dart';
import 'package:safaqat/safaqat/data/models/news/news_query.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/data/models/news/news_response.dart';
import 'package:safaqat/safaqat/data/models/posts/post_dto.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/news/get_news_usecase.dart';
import 'package:safaqat/safaqat/domain/usecases/news/search_news_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/news/public/news_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/public/posts_controller.dart';

class HomeController extends GetxController {
  final PostsController _postsController = Get.find();
  final NewsController _newsController = Get.find();

  List<PostDto> get posts => _postsController.filteredPosts.value;
  List<NewsDto> get news => _newsController.news.value;

  Resources<dynamic> get resources => _postsController.status.value;

  void getPosts() => _postsController.getPosts();
  void logout() => _postsController.logout();

  void searchPosts(String query) => _postsController.searchPosts(query);
}
