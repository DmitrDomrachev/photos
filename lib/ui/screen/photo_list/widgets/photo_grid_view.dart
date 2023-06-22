import 'package:flutter/cupertino.dart';
import 'package:photos/domain/photo.dart';
import 'package:photos/ui/screen/photo_list/widgets/image_holder.dart';

class PhotoGridView extends StatelessWidget {
  const PhotoGridView({super.key, this.data});

  final List<Photo>? data;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: data?.length ?? 0,
          (_, index) {
            return ImageHolder(
              key: ValueKey(index.toString()),
              image: Image.network(
                data![index].url,
                fit: BoxFit.cover,
              ),
              title: data![index].username,
              subTitle: '${data![index].likes} likes',
            );
          },
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
        ),
      ),
    );
  }
}
