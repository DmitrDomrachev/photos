import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:photos/data/api/photo_client.dart';
import 'package:photos/data/repository/photo_repository.dart';
import 'package:photos/ui/app/app.dart';
import 'package:photos/ui/screen/photo_list/photo_list_page_model.dart';
import 'package:provider/provider.dart';

class AppDependencies extends StatefulWidget {
  const AppDependencies({required this.app, Key? key}) : super(key: key);

  final MyApp app;

  @override
  State<AppDependencies> createState() => _AppDependenciesState();
}

class _AppDependenciesState extends State<AppDependencies> {
  late final IPhotoRepository _photoRepository;
  late final PhotoListPageModel _photoListPageModel;
  late final PhotoClient _photoClient;
  late final Dio _dio;

  @override
  void initState() {
    super.initState();
    _dio = Dio();
    _photoClient = PhotoClient(_dio);
    _photoRepository = WebPhotoRepository(_photoClient);
    _photoListPageModel = PhotoListPageModel(_photoRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Provider<PhotoListPageModel>(
      create: (_) => _photoListPageModel,
      child: widget.app,
    );
  }
}
