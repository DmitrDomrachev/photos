import 'package:photos/domain/photo.dart';

abstract interface class IPhotoRepository {
  Future<List<Photo>> getPhotos(int page, {int photoPerPage = 10});
}

class PhotoRepositoryDemo implements IPhotoRepository {
  @override
  Future<List<Photo>> getPhotos(int page, {int photoPerPage = 10}) async {
    final photos = List<Photo>.generate(
      10,
      (index) => Photo(
          url:
              'https://aif-s3.aif.ru/images/027/309/0c45b779cd95cf33c4f9acef12716837.jpg',
          id: (page * photoPerPage + index).toString(),
          username: 'Egor',
          likes: (page * photoPerPage + index)),
    );
    if (page > 5) {
      throw Exception();
    }
    return await Future.delayed(const Duration(seconds: 1), () => photos);
  }
}
