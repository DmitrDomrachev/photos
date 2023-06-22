import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:photos/res/theme/app_typography.dart';
import 'package:photos/ui/screen/photo_list/photo_list_page_widget_model.dart';
import 'package:photos/ui/screen/photo_list/widgets/photo_grid_view.dart';

class PhotoListPage extends ElementaryWidget<IPhotoPageWM> {
  const PhotoListPage({
    Key? key,
    WidgetModelFactory wmFactory = photoListPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPhotoPageWM wm) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        controller: ScrollController(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
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
              border:
                  Border(bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0))),
            ),
          ];
        },
        body: NotificationListener<ScrollNotification>(
          onNotification: wm.onNotification,
          child: EntityStateNotifierBuilder(
            listenableEntityState: wm.photos,
            builder: (_, data) {
              return PhotoGridView(
                data: data,
                onPressed: wm.navigateToPhotoInfo,
              );
            },
            loadingBuilder: (_, data) {
              return LoadingPhotoGridView(
                data: data,
                onPressed: wm.navigateToPhotoInfo,
              );
            },
          ),
        ),
      ),
    );
  }
}
