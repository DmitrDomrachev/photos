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

  Future<List<Photo>> getPhotos() {
    return model.getPhotos();
  }
}

// abstract interface class IPhotoListPageWidgetModel extends IWidgetModel{
//
// }
