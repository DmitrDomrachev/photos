import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:photos/domain/photo.dart';
import 'package:photos/res/theme/app_typography.dart';
import 'package:photos/ui/screen/photo_list/photo_list_page_widget_model.dart';

class PhotoListPage extends ElementaryWidget<PhotoListPageWidgetModel> {
  PhotoListPage({
    Key? key,
    WidgetModelFactory wmFactory = photoListPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(PhotoListPageWidgetModel wm) {
    return CustomScrollView(
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
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          sliver: FutureBuilder<List<Photo>>(
              future: wm.getPhotos(),
              builder: (context, snapshot) {
                return SliverGrid(

                    delegate: SliverChildBuilderDelegate(childCount: snapshot.data?.length,
                        (BuildContext _, int index) {
                      return ImageHolder(
                        key: Key(index.toString()),
                        image: Image.network(
                          snapshot.data?[index].url ?? '',
                          fit: BoxFit.cover,
                        ),
                        title: snapshot.data?[index].username ?? 'username',
                        subTitle: '${snapshot.data?[index].likes ?? -1} likes',
                      );
                    }),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 24,
                    ));
              }),
        )
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
