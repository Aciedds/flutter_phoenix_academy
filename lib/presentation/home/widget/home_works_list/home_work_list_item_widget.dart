import 'package:flutter/material.dart';

class HomeWorksListItemWidget extends StatelessWidget {
  final String titleName;
  final String imageUrl;

  const HomeWorksListItemWidget({
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
                    "Due Date: Today",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 20),
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
