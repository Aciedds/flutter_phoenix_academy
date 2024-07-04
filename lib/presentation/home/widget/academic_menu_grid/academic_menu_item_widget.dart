import 'package:flutter/material.dart';
import 'package:flutter_phoenix_academy/config/constants/color_contants.dart';

class AcademicMenu extends StatelessWidget {
  final IconData icon;
  final Color cardColor;
  final String title;
  final Function() onTap;

  const AcademicMenu({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      semanticContainer: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: ColorPalette.primary,
              size: 35,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
