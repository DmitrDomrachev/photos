import 'package:flutter/cupertino.dart';
import 'package:photos/ui/screen/photo_info/photo_info_page.dart';
import 'package:photos/ui/screen/photo_list/photo_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
      ),
      home: CupertinoPageScaffold(
        child: PhotoInfoPage(), //Photo detail page
        // child: PhotoListPage(), //Photos list page
      ),
    );
  }
}
