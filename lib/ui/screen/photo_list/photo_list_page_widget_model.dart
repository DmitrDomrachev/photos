import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';
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
  final _controller = ScrollController();
  final EntityStateNotifier<List<Photo>> _photos = EntityStateNotifier();

  @override
  get controller => _controller;

  @override
  ListenableState<EntityState<List<Photo>?>> get photos => _photos;

  int _currentPage = 0;

  PhotoListPageWidgetModel(super.model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _controller.addListener(_scrollListener);
    _addPhotos();
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

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      _incrementCurrentPage();
      _addPhotos();
    }
  }

  void _incrementCurrentPage() {
    _currentPage++;
  }
}

abstract interface class IPhotoPageWM extends IWidgetModel {
  ListenableState<EntityState<List<Photo>?>> get photos;

  ScrollController get controller;
}
