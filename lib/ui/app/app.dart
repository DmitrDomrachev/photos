import 'package:flutter/cupertino.dart';
import 'package:photos/ui/screen/photo_list/photo_list_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
      ),
      home: CupertinoPageScaffold(
        child: PhotoListPage(),
      ),
    );
  }
}
