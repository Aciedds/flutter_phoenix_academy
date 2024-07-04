import 'package:flutter/material.dart';
import 'package:flutter_phoenix_academy/config/constants/color_contants.dart';
import 'package:flutter_phoenix_academy/presentation/home/home_controller.dart';
import 'package:flutter_phoenix_academy/presentation/home/widget/academic_menu_grid/academic_menu_grid_widget.dart';
import 'package:flutter_phoenix_academy/presentation/home/widget/home_collapsed_appbar/home_collapsed_appbar_widget.dart';
import 'package:flutter_phoenix_academy/presentation/home/widget/home_works_list/home_work_list_widget.dart';
import 'package:flutter_phoenix_academy/presentation/home/widget/upcoming_class_carousel/upcoming_class_carousel_widget.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          HomeCollapsedAppbarWidget(),
          DecoratedSliver(
            decoration: const BoxDecoration(
              color: ColorPalette.primary,
            ),
            sliver: SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                child: Text(
                  "Academics",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: AcademicMenuGridWidget(),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 0,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Upcoming Classes",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          UpcomingClassCarouselWidget(),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 0,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Home Works",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 0,
            ),
            sliver: HomeWorkListWidget(),
          ),
        ],
      ),
    );
  }
}
