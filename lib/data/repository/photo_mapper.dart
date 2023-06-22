import 'package:photos/data/model/photo_data.dart';
import 'package:photos/domain/photo.dart';

Photo mapPhoto(dynamic photo) {
  final photoData = photo as PhotoData;
  return Photo(
    url: photoData.urls.full,
    id: photoData.id,
    username: photoData.user.username,
    likes: photoData.likes,
  );
}
