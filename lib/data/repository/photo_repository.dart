import 'package:photos/domain/photo.dart';

abstract interface class IPhotoRepository {
  Future<List<Photo>> getPhotos(int page);
}

class PhotoRepositoryDemo implements IPhotoRepository {
  @override
  Future<List<Photo>> getPhotos(int page) async {
    final photos = List<Photo>.generate(
      10,
      (index) => Photo(
          url:
              'https://aif-s3.aif.ru/images/027/309/0c45b779cd95cf33c4f9acef12716837.jpg',
          id: (page + index).toString(),
          username: 'Egor',
          likes: (page + index)),
    );

    return await Future.delayed(Duration.zero, () => photos);
  }
}
