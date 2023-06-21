import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photos/res/theme/app_typography.dart';

// PhotoInfoPage did not implement state management for the screen,
// because the screen has only one state.
// Before switching to the PhotoInfoPage screen,
// we made sure that the values of imageUrl, title and subTitle are correct.

class PhotoInfoPage extends StatelessWidget {
  const PhotoInfoPage(
      {super.key,
      this.imageUrl =
          'https://w7.pngwing.com/pngs/67/315/png-transparent-flutter-hd-logo-thumbnail.png',
      this.title = 'Flutter',
      this.subTitle = '9 likes'});

  final String imageUrl;
  final String title;
  final String subTitle;

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
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.titleLarge,
                  ),
                  Text(
                    subTitle,
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
