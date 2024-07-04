import 'package:flutter/material.dart';
import 'package:flutter_phoenix_academy/config/constants/assets_constants.dart';
import 'package:flutter_phoenix_academy/presentation/home/widget/home_works_list/home_work_controller.dart';
import 'package:flutter_phoenix_academy/presentation/home/widget/home_works_list/home_work_list_item_widget.dart';
import 'package:get/get.dart';

class HomeWorkListWidget extends StatelessWidget {
  final HomeWorkController controller = Get.put(HomeWorkController());

  HomeWorkListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      key: controller.listKey,
      itemBuilder: (context, index, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: HomeWorksListItemWidget(
            titleName: "Title ${controller.homeWorkList[index]}",
            imageUrl: AssetsConstants.icChemistry,
          ),
        );
      },
      initialItemCount: controller.homeWorkList.length,
    );
  }
}
