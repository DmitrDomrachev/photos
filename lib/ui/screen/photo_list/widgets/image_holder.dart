import 'package:flutter/cupertino.dart';
import 'package:photos/res/theme/app_typography.dart';

class ImageHolder extends StatelessWidget {
  const ImageHolder(
      {required this.image, super.key, this.title, this.subTitle,});

  final Image image;
  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: 158,
          height: 158,
          child: Stack(
            fit: StackFit.expand,
            children: [
              image,
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '',
                      style: AppTypography.labelMedium,
                    ),
                    Text(
                      subTitle ?? '',
                      style: AppTypography.labelSmall,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
