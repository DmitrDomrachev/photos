import 'package:dio/dio.dart' hide Headers;
import 'package:photos/data/dto/photo_data.dart';
import 'package:retrofit/retrofit.dart';

part 'photo_client.g.dart';

@RestApi(baseUrl: 'https://api.unsplash.com/')
abstract class PhotoClient {
  factory PhotoClient(Dio dio, {String baseUrl}) = _PhotoClient;

  @Headers({'Authorization': 'Client-ID 896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043'})
  @GET('photos?page={page}')
  Future<List<PhotoData>> getPhotos(@Path('page')int page, int perPage);
}
