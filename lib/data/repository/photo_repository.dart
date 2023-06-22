import 'package:photos/data/api/photo_client.dart';
import 'package:photos/data/repository/photo_mapper.dart';
import 'package:photos/domain/photo.dart';

abstract interface class IPhotoRepository {
  Future<Iterable<Photo>> getPhotos(int page, {int photoPerPage = 10});
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
        likes: (page * photoPerPage + index),
      ),
    );
    if (page > 5) {
      throw Exception();
    }
    return Future.delayed(const Duration(seconds: 1), () => photos);
  }
}

class WebPhotoRepository implements IPhotoRepository {
  final PhotoClient _client;

  WebPhotoRepository(this._client);

  @override
  Future<Iterable<Photo>> getPhotos(int page, {int photoPerPage = 10}) async {
    final data = await _client.getPhotos(page, photoPerPage);
    return data.map(mapPhoto);
  }
}
