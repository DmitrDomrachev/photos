import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:photos/domain/photo.dart';
import 'package:photos/res/theme/app_typography.dart';
import 'package:photos/ui/screen/photo_list/photo_list_page_widget_model.dart';

class PhotoListPage extends ElementaryWidget<PhotoListPageWidgetModel> {
  const PhotoListPage({
    Key? key,
    WidgetModelFactory wmFactory = photoListPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(PhotoListPageWidgetModel wm) {
    return CustomScrollView(
    controller: wm.controller,
      slivers: [
        CupertinoSliverNavigationBar(
          leading: CupertinoButton(
            onPressed: () {
              wm.addPhotos();
            },
            child: const Text('add'),
          ),
          largeTitle: const Text(
            'Photos',
            style: AppTypography.appBarLargeTitle,
          ),
          middle: const Text(
            'Photos',
            style: AppTypography.appBarMiddle,
          ),
          alwaysShowMiddle: false,
          backgroundColor: const Color.fromRGBO(255, 255, 255, 0.75),
          border: const Border(bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0))),
        ),

        EntityStateNotifierBuilder(listenableEntityState: wm.photos, builder: (_, data){
          return SliverPadding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    childCount: data?.length ?? 0,
                        (BuildContext _, int index) {
                      return ImageHolder(
                        key: Key(index.toString()),
                        image: Image.network(
                          data![index].url,
                          fit: BoxFit.cover,
                        ),
                        title: data[index].username,
                        subTitle: '${data[index].likes} likes',
                      );
                    }),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                )),
          );
        }),
      ],
    );
  }
}

class ImageHolder extends StatelessWidget {
  const ImageHolder(
      {super.key, required this.image, this.title = '', this.subTitle = ''});

  final Image image;
  final String title;
  final String subTitle;

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
                      title,
                      style: AppTypography.labelMedium,
                    ),
                    Text(
                      subTitle,
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
