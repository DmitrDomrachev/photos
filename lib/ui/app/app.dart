import 'package:flutter/cupertino.dart';
import 'package:photos/navigation/app_router.dart';

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
        child: CupertinoApp.router(
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
