import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "APP LOGO",
                  style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(fontSize: 24),
                ),
                CupertinoButton(
                  padding: const EdgeInsets.only(top: 16, left: 8, bottom: 16, right: 0),
                  onPressed: () {},
                  child: const Icon(
                    CupertinoIcons.bell_solid,
                    color: AppColor.hardGreen,
                  ),
                ),
              ],
            ),
          ),
          12.height,
          Container(
            margin: 20.paddingOnlyLeftRight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: 12.borderRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: 12.borderRadius,
              child: SizedBox(
                height: 220,
                child: CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) {
                    return SizedBox.expand(
                      child: Stack(
                        children: [
                          SizedBox.expand(
                            child: CachedNetworkImage(
                              imageUrl: index.randomImage(width: 1024, height: 1024),
                              fit: BoxFit.cover,
                              progressIndicatorBuilder: (context, url, progress) {
                                return const Center(
                                  child: CupertinoActivityIndicator(),
                                );
                              },
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: 20.padding,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.05),
                                  Colors.black.withOpacity(0.5),
                                ],
                              ),
                            ),
                            alignment: Alignment.bottomLeft,
                            child: Text(36.lorem(),style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(color: Colors.white,fontSize: 28),),
                          ),
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 220,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    scrollPhysics: const ClampingScrollPhysics(),
                    disableCenter: false,
                    enlargeCenterPage: false,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
