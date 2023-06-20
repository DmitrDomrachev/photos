import 'package:flutter/cupertino.dart';
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

  @override
  void initState() {
    _photoRepository = PhotoRepositoryDemo();
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
