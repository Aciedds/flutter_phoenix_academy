import 'package:flutter/material.dart';
import 'package:flutter_phoenix_academy/presentation/constants/assets_constants.dart';
import 'package:flutter_phoenix_academy/presentation/constants/color_contants.dart';
import 'package:flutter_phoenix_academy/presentation/home/widget/home_collapsed_appbar/home_collapsed_appbar_controller.dart';
import 'package:get/get.dart';

class HomeCollapsedAppbarWidget extends StatelessWidget {
  HomeCollapsedAppbarWidget({super.key});

  final controller = Get.put(HomeCollapsedAppbarController());

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: kToolbarHeight + 168,
      collapsedHeight: kToolbarHeight,
      leading: const SizedBox.shrink(),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.white,
          ),
        ),
      ],
      leadingWidth: 0,
      // onStretchTrigger: () {
      //   // Handle snapping programmatically when collapsing starts
      //   Future.microtask(() {
      //     controller.animationController.forward(from: 0.0);
      //   });
      //
      //   return Future.value(true);
      // },
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          controller.top.value = constraints.biggest.height;
          return FlexibleSpaceBar(
            centerTitle: true,
            title: Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _buildTitle(context: context),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTitle({required BuildContext context}) {
    return controller.top.value < 200
        ? _buildCollapsedTitle(context: context)
        : _buildExpandedTitleWithProgress(context: context);
  }

  Widget _buildCollapsedTitle({required BuildContext context}) {
    return FadeTransition(
      opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
          parent: controller.animation,
          curve: Curves.easeInOut,
        ),
      ),
      child: Text(
        "Nama User",
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }

  Widget _buildExpandedTitleWithProgress({required BuildContext context}) {
    return _buildStyledCard(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildText(
                context: context,
                text: 'Nama User',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              _buildText(
                context: context,
                text: 'X IPA 3',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              _buildText(
                context: context,
                text: 'Attendance',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 5),
              AnimatedBuilder(
                animation: controller.animation,
                builder: (context, child) {
                  return Obx(() {
                    return LinearProgressIndicator(
                      color: ColorPalette.colorB,
                      minHeight: 6,
                      value: controller.progress.value,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation(
                        ColorPalette.colorB,
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        _buildAvatar(),
      ],
    );
  }

  Widget _buildStyledCard({
    required List<Widget> children,
    EdgeInsets padding = const EdgeInsets.all(8.0),
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: ColorPalette.colorD.withOpacity(.1),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Obx(() {
      double avatarRadius = controller.top.value > 200 ? 35 : 20;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.white.withOpacity(.3),
          child: CircleAvatar(
            radius: avatarRadius - 5,
            child: Image.asset(AssetsConstants.logo),
          ),
        ),
      );
    });
  }

  Widget _buildText({
    required BuildContext context,
    required String text,
    required TextStyle? style,
  }) {
    return Text(
      text,
      style: style?.copyWith(color: Colors.white),
    );
  }
}
