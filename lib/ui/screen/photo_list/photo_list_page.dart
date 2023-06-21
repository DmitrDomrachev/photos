import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:photos/res/theme/app_typography.dart';
import 'package:photos/ui/screen/photo_list/photo_list_page_widget_model.dart';
import 'widgets/widgets.dart';

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
