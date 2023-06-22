import 'package:go_router/go_router.dart';
import 'package:photos/ui/screen/photo_info/photo_info_page.dart';
import 'package:photos/ui/screen/photo_list/photo_list_page.dart';

class AppRouter {
  static final _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) {
          return const PhotoListPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'info',
            name: 'info',
            builder: (context, state) {
              return PhotoInfoPage(
                imageUrl: state.queryParameters['imageUrl'],
                title: state.queryParameters['title'],
                likes: state.queryParameters['likes'],
              );
            },
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
