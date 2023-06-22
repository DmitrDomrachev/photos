import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:photos/domain/photo.dart';
import 'package:photos/ui/screen/photo_list/photo_list_page.dart';
import 'package:photos/ui/screen/photo_list/photo_list_page_model.dart';
import 'package:provider/provider.dart';

PhotoListPageWidgetModel photoListPageWidgetModelFactory(BuildContext context) {
  final model = context.read<PhotoListPageModel>();
  return PhotoListPageWidgetModel(model);
}

//TODO: обработать случай, в котором все доступные для списка данные получены

class PhotoListPageWidgetModel
    extends WidgetModel<PhotoListPage, PhotoListPageModel>
    implements IPhotoPageWM {
  final List<Photo> _photoList = [];
  final EntityStateNotifier<List<Photo>> _photos = EntityStateNotifier();

  @override
  ListenableState<EntityState<List<Photo>?>> get photos => _photos;

  int _currentPage = 1;

  PhotoListPageWidgetModel(super.model);

  @override
  bool onNotification(Notification notification) {
    if (notification is ScrollEndNotification) {
      if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
        _incrementCurrentPage();
        _addPhotos();
        return true;
      }
    }
    return true;
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _addPhotos();
  }

  @override
  void navigateToPhotoInfo(Photo photo) {
    context.goNamed(
      'info',
      queryParameters: <String, String>{
        'imageUrl': photo.url,
        'title': photo.username,
        'likes': photo.likes.toString(),
      },
    );
  }

  Future<void> _addPhotos() async {
    try {
      _photos.loading(_photos.value?.data);
      final newPhotos = await model.getPhotos(page: _currentPage);
      _photoList.addAll(newPhotos);
      _photos.content(_photoList);
    } on Exception catch (err) {
      _photos.error(err, _photos.value?.data);
    }
  }

  void _incrementCurrentPage() {
    _currentPage++;
  }
}

abstract interface class IPhotoPageWM extends IWidgetModel {
  ListenableState<EntityState<List<Photo>?>> get photos;

  void navigateToPhotoInfo(Photo photo);

  bool onNotification(Notification notification);
}
