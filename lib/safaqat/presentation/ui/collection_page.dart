import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/presentation/custom_views/app_bar_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/public/events_page.dart';
import 'package:safaqat/safaqat/presentation/ui/news/public/news_page.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/public/posts_page.dart';
import 'package:safaqat/safaqat/presentation/ui/projects/public/projects_page.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({Key? key, this.logged = false}) : super(key: key);

  final bool logged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBarWidget(
              height: 0,
              width: Get.width,
              bottom: TabBar(
                isScrollable: true,
                labelColor: AppColors.primaryColor,
                indicatorColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.shadePrimary,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.news),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.events),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.posts),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.projects),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                NewsPage(logged: logged),
                EventsPage(logged: logged),
                PostsPage(logged: logged), // PostsPage(isLogged: logged),
                ProjectsPage(logged: logged), // PostsPage(isLogged: logged),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
