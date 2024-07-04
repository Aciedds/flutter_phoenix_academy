import 'package:flutter/material.dart';
import 'package:flutter_phoenix_academy/config/constants/color_contants.dart';
import 'package:flutter_phoenix_academy/presentation/home/widget/academic_menu_grid/academic_menu_item_widget.dart';

class AcademicMenuGridWidget extends StatelessWidget {
  AcademicMenuGridWidget({super.key});

  final List<AcademicMenu> academicMenu = [
    AcademicMenu(
      icon: Icons.calendar_today_outlined,
      title: "Attandance",
      onTap: () {},
      cardColor: ColorPalette.colorC,
    ),
    AcademicMenu(
      icon: Icons.person_outlined,
      title: "Teachers",
      onTap: () {},
      cardColor: ColorPalette.colorC,
    ),
    AcademicMenu(
      icon: Icons.book_outlined,
      title: "Books",
      onTap: () {},
      cardColor: ColorPalette.colorC,
    ),
    AcademicMenu(
      icon: Icons.data_thresholding_outlined,
      title: "Report",
      onTap: () {},
      cardColor: ColorPalette.colorC,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: 1,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          IconData icon = academicMenu[index].icon;
          String title = academicMenu[index].title;
          Color cardColor = academicMenu[index].cardColor;
          VoidCallback onTap = academicMenu[index].onTap;
          return AcademicMenu(
            icon: icon,
            title: title,
            onTap: onTap,
            cardColor: cardColor,
          );
        },
        childCount: academicMenu.length,
      ),
    );
  }
}
