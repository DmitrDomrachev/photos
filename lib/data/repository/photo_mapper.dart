import 'package:photos/data/model/photo_data.dart';
import 'package:photos/domain/photo.dart';

Photo mapPhoto(dynamic photo) {
  final photoData = photo as PhotoData;
  return Photo(
    urlFull: photoData.urls.full,
    urlSmall: photoData.urls.small,
    id: photoData.id,
    username: photoData.user.username,
    likes: photoData.likes,
  );
}
