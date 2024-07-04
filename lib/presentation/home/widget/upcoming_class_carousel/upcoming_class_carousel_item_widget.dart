import 'package:flutter/material.dart';
import 'package:flutter_phoenix_academy/config/constants/color_contants.dart';

class UpcomingClassCarouselItemWidget extends StatelessWidget {
  final String titleName;
  final String imageUrl;

  const UpcomingClassCarouselItemWidget({
    super.key,
    required this.imageUrl,
    required this.titleName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Class Title",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "10:00 - 12:00",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 120,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: ColorPalette.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Join Class",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 1,
                          height: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.video_camera_front_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Image.asset(
              imageUrl,
              fit: BoxFit.fitWidth,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}
