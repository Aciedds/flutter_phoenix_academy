import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCollapsedAppbarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  RxDouble top = 0.0.obs;
  RxDouble progress = 0.5.obs;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    animation = Tween<double>(begin: 0.0, end: progress.value).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    animationController.forward();
  }

  void updateProgress(double newProgress) {
    progress.value = newProgress;
    animation = Tween<double>(
      begin: animation.value,
      end: progress.value,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
