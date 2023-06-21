import 'package:flutter/cupertino.dart';
import 'package:photos/domain/photo.dart';
import 'widgets.dart';

class PhotoGridView extends StatelessWidget {
  const PhotoGridView({super.key, this.data});

  final List<Photo>? data;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(childCount: data?.length ?? 0,
              (BuildContext _, int index) {
            return ImageHolder(
              key: ValueKey(index.toString()),
              image: Image.network(
                data![index].url,
                //можем использовать ! , так как указали childCount
                fit: BoxFit.cover,
              ),
              title: data![index].username,
              subTitle: '${data![index].likes} likes',
            );
          }),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
          )),
    );
  }
}
