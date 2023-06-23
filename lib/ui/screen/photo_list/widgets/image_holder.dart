
import 'package:flutter/cupertino.dart';
import 'package:photos/res/theme/app_typography.dart';

class ImageHolder extends StatelessWidget {
  const ImageHolder({
    required this.imageUrl,
    super.key,
    this.title,
    this.subTitle,
    this.onPressed,
  });

  final String imageUrl;
  final String? title;
  final String? subTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: 158,
            height: 158,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (
                    context,
                    child,
                    loadingProgress,
                  ) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  },
                ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
