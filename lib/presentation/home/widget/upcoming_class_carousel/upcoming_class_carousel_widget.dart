import 'package:flutter/material.dart';
import 'package:flutter_phoenix_academy/presentation/home/widget/upcoming_class_carousel/upcoming_class_carousel_controller.dart';
import 'package:flutter_phoenix_academy/presentation/home/widget/upcoming_class_carousel/upcoming_class_carousel_item_widget.dart';
import 'package:get/get.dart';

class UpcomingClassCarouselWidget extends StatelessWidget {
  final UpcomingClassCarouselController controller =
      Get.put(UpcomingClassCarouselController());

  UpcomingClassCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 200.0,
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: controller.imgList.length,
              onPageChanged: (index) {
                controller.currentIndex.value = index;
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: controller.pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (controller.pageController.position.haveDimensions) {
                      // Simplify the calculation and make it more readable
                      value = (1 -
                              (controller.pageController.page! - index).abs() *
                                  0.3)
                          .clamp(0.0, 1.0);
                    }
                    return SizedBox(
                      height: Curves.easeInOut.transform(value) * 200,
                      child: child,
                    );
                  },
                  // Provide a key to the UpcomingClassCarouselItemWidget
                  // for better performance during rebuilds.
                  child: UpcomingClassCarouselItemWidget(
                    key: ValueKey(controller.imgList[index]),
                    imageUrl: controller.imgList[index],
                    // Considerreplacing the placeholder '-' with actual title data
                    // if available, or remove the titleName property altogether.
                    titleName: '-',
                  ),
                );
              },
            ),
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.imgList.asMap().entries.map((item) {
                int index = item.key;
                const activeColor = Color.fromRGBO(0, 0, 0, 0.9);
                const inactiveColor = Color.fromRGBO(0, 0, 0, 0.4);

                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 2.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // Use a ternary operator for more concise color assignment.
                    color: controller.currentIndex.value == index
                        ? activeColor
                        : inactiveColor,
                  ),
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}
