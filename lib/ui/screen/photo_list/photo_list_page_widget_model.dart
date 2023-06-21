import 'dart:math';

import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';
import 'package:photos/data/repository/photo_repository.dart';
import 'package:photos/domain/photo.dart';
import 'package:photos/ui/screen/photo_list/photo_list_page.dart';
import 'package:photos/ui/screen/photo_list/photo_list_page_model.dart';
import 'package:provider/provider.dart';

PhotoListPageWidgetModel photoListPageWidgetModelFactory(BuildContext context) {
  final model = context.read<PhotoListPageModel>();
  return PhotoListPageWidgetModel(model);
}

class PhotoListPageWidgetModel
    extends WidgetModel<PhotoListPage, PhotoListPageModel> {
  PhotoListPageWidgetModel(super.model);

  final List<Photo> _photoList = [];
  int currentPage = 1;
  final controller = ScrollController();
  EntityStateNotifier<List<Photo>> photos = EntityStateNotifier();

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    controller.addListener(_scrollListener);
    addPhotos();
  }

  void addPhotos() async {
    final newPhotos = await model.getPhotos(page: currentPage);
    _photoList.addAll(newPhotos);
    photos.content(_photoList);
    currentPage++;
  }

  void _scrollListener(){
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      addPhotos();
    }
  }
}
