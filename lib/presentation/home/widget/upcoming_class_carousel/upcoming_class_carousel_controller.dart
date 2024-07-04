import 'package:flutter/material.dart';
import 'package:flutter_phoenix_academy/presentation/constants/assets_constants.dart';
import 'package:get/get.dart';

class UpcomingClassCarouselController extends GetxController {
  RxInt currentIndex = 0.obs;
  late PageController pageController;

  final List<String> imgList = [
    AssetsConstants.icChemistry,
    AssetsConstants.icChemistry,
    AssetsConstants.icChemistry,
    AssetsConstants.icChemistry,
    AssetsConstants.icChemistry,
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(
      initialPage: currentIndex.value,
      viewportFraction: .9,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
