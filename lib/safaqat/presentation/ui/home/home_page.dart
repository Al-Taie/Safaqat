import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/extensions/list_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/presentation/custom_views/app_bar_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/status_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/contracts/mine/my_contracts_page.dart';
import 'package:safaqat/safaqat/presentation/ui/events/mine/my_events_page.dart';
import 'package:safaqat/safaqat/presentation/ui/home/home_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/news/components/app_drawer.dart';
import 'package:safaqat/safaqat/presentation/ui/news/details/news_details_page.dart';
import 'package:safaqat/safaqat/presentation/ui/news/mine/my_news_page.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/components/post_card_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/details/post_details_page.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/mine/my_posts_page.dart';
import 'package:safaqat/safaqat/presentation/ui/projects/mine/my_projects_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.logged = false}) : super(key: key);

  final bool logged;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        drawer: logged
            ? AppDrawer(
          name: '-',
          imageUrl:
          'https://st2.depositphotos.com/1006318/5909/v/600/depositphotos_59095205-stock-illustration-businessman-profile-icon.jpg',
          onManageNews: const MyNewsPage().navTo,
          onManageEvents: const MyEventsPage().navTo,
          onManagePosts: const MyPostsPage().navTo,
          onManageProjects: const MyProjectsPage().navTo,
          onProfile: () {},
          onManageContracts: const MyContractsPage().navTo,
          onLogout: controller.logout,
        )
            : null,
        appBar: AppBarWidget(
          width: Get.width,
          title: AppStrings.home,
        ),
        body: Obx(() {
          return StatusWidget(
            status: controller.resources.status,
            onClickTryAgain: controller.getPosts,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 350),
                        autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                        enlargeCenterPage: false,
                        enlargeFactor: 0,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        // onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemCount: controller.news.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        var item = controller.news[itemIndex];

                        Widget image = ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            width: Get.width,
                            imageUrl: item.images.firstOrNull ?? '',
                            fit: BoxFit.cover,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: AppColors.primaryColor,
                                value: downloadProgress.progress,
                              ),
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          ),
                        );

                        return GestureDetector(
                          onTap: NewsDetailsPage(news: item).navTo,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              image,
                              Container(
                                height: 48,
                                decoration: BoxDecoration(
                                    color:
                                        AppColors.primaryColor.withOpacity(0.7),
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    )),
                                child: Align(
                                  alignment: Utils.isRTL
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(
                                      item.title,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFFEFBFF),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Text(
                      AppStrings.opportunitiesAndRequests,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.shadePrimary,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        8,
                        16,
                        16,
                      ),
                      itemCount: controller.posts.length,
                      itemBuilder: (context, index) {
                        var item = controller.posts[index];
                        return PostCardWidget(
                          title: item.title,
                          name: item.ownerName ?? '-',
                          image: item.images.firstOrNull ?? '',
                          date: Utils.formatDate(dateStr: item.expiryDate),
                          type: item.type?.name ?? '-',
                          cityName: item.city?.name ?? '-',
                          onPressed: () => PostDetailsPage(post: item).navTo(),
                        );
                      }),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
