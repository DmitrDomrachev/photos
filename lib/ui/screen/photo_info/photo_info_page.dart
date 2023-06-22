import 'package:flutter/cupertino.dart';
import 'package:photos/res/theme/app_typography.dart';

class PhotoInfoPage extends StatelessWidget {
  const PhotoInfoPage(
      {super.key,
      this.imageUrl,
      this.title = 'Photographer',
      this.likes = 0});

  final String? imageUrl;
  final String title;
  final int likes;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(32)),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2.3,
                width: MediaQuery.of(context).size.width,
                child: imageUrl == null ? const ColoredBox(color: Color.fromRGBO(50, 50, 50, 1),) : Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.titleLarge,
                  ),
                  Text(
                    '$likes likes',
                    style: AppTypography.titleMedium,
                  ),
                ],
              ),
            )
          ],
        ),
        Positioned(
            top: 43,
            left: 15,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: const Text(
                '< Back',
                style: AppTypography.appBarButton,
              ),
            ))
      ],
    );
  }
}
