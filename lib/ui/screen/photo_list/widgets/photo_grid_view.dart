import 'package:flutter/cupertino.dart';
import 'package:photos/domain/photo.dart';
import 'package:photos/ui/screen/photo_list/widgets/image_holder.dart';

class PhotoGridView extends StatelessWidget {
  const PhotoGridView({
    required this.onPressed,
    super.key,
    this.data,
  });

  final List<Photo>? data;
  final Function(Photo) onPressed;

  @override
  Widget build(BuildContext context) {
    final itemCount = data?.length ?? 0;
    return GridView.builder(
      key: const PageStorageKey(1),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return ImageHolder(
          key: ValueKey(index.toString()),
          imageUrl: data![index].url,
          title: data![index].username,
          subTitle: '${data![index].likes} likes',
          onPressed: () {
            onPressed(data![index]);
          },
        );
      },
    );
  }
}

class LoadingPhotoGridView extends StatelessWidget {
  const LoadingPhotoGridView({
    required this.onPressed,
    super.key,
    this.data,
  });

  final List<Photo>? data;
  final Function(Photo) onPressed;

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const PageStorageKey(1),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        PhotoGridView(
          data: data,
          onPressed: onPressed,
        ),
        const CupertinoActivityIndicator(),
      ],
    );
  }
}
