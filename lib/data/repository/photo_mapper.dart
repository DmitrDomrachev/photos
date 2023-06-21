import 'package:photos/data/dto/photo_data.dart';
import 'package:photos/domain/photo.dart';

Photo mapPhoto(PhotoData photo) {
  return Photo(
      url: photo.urls.full,
      id: photo.id,
      username: photo.user.username,
      likes: photo.likes);
}
