import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:photos/res/theme/app_typography.dart';

class PhotoInfoPage extends StatelessWidget {
  const PhotoInfoPage({
    super.key,
    this.imageUrl,
    this.title,
    this.likes,
  });

  final String? imageUrl;
  final String? title;
  final String? likes;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(32)),
              child: SizedBox(
                height: size.height / 2.3,
                width: size.width,
                child: imageUrl == null
                    ? const ColoredBox(
                        color: Color.fromRGBO(50, 50, 50, 1),
                      )
                    : Image.network(
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
                    title ?? '',
                    style: AppTypography.titleLarge,
                  ),
                  Text(
                    '${likes ?? -1} likes',
                    style: AppTypography.titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 43,
          left: 15,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => context.goNamed('home'),
            child: const Text(
              '< Back',
              style: AppTypography.appBarButton,
            ),
          ),
        ),
      ],
    );
  }
}
