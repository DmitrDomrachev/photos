import 'package:elementary/elementary.dart';
import 'package:photos/data/repository/photo_repository.dart';
import 'package:photos/domain/photo.dart';

class PhotoListPageModel extends ElementaryModel {
  final IPhotoRepository _photoRepository;

  PhotoListPageModel(this._photoRepository);

  Future<List<Photo>> getPhotos({int page = 1}) async {
    return _photoRepository.getPhotos(page);
  }
}
