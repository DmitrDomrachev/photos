import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:photos/domain/photo.dart';
import 'package:photos/res/theme/app_typography.dart';
import 'package:photos/ui/screen/photo_list/photo_list_page_widget_model.dart';

import 'widgets/image_holder.dart';

class PhotoListPage extends ElementaryWidget<IPhotoPageWM> {
  const PhotoListPage({
    Key? key,
    WidgetModelFactory wmFactory = photoListPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPhotoPageWM wm) {
    return CustomScrollView(
      controller: wm.controller,
      slivers: [
        const CupertinoSliverNavigationBar(
          largeTitle: Text(
            'Photos',
            style: AppTypography.appBarLargeTitle,
          ),
          middle: Text(
            'Photos',
            style: AppTypography.appBarMiddle,
          ),
          alwaysShowMiddle: false,
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.75),
          border: Border(bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0))),
        ),
        EntityStateNotifierBuilder(
            listenableEntityState: wm.photos,
            errorBuilder: (_, __, data) {
              return PhotoGridView(data: data);
            },
            loadingBuilder: (_, data) {
              return PhotoGridView(data: data);
            },
            builder: (_, data) {
              return PhotoGridView(data: data);
            }),
        EntityStateNotifierBuilder(
            listenableEntityState: wm.photos,
            errorBuilder: (_, __, ___) {
              return const SliverToBoxAdapter();
            },
            loadingBuilder: (_, __) {
              return const LoadingIndicator();
            },
            builder: (_, data) {
              return const SliverToBoxAdapter();
            }),
      ],
    );
  }
}

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

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverPadding(
      padding: EdgeInsets.only(bottom: 25),
      sliver: SliverToBoxAdapter(
        child: Center(
            child: SizedBox(
          width: 22,
          height: 22,
          child: CupertinoActivityIndicator(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        )),
      ),
    );
  }
}
