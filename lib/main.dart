import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'core/providers/auth_provider.dart';
import 'core/providers/user_provider.dart';
import 'core/services/app_lifecycle.dart';
import 'core/services/persistence/local_storage_service.dart';
import 'core/services/persistence/persistence.dart';
import 'ui/firstpath_page.dart';
import 'ui/firstpath_page/first_first_page.dart';
import 'ui/firstpath_page/first_second_page.dart';
import 'ui/main_page.dart';
import 'ui/secondpath_page.dart';
import 'utils/snack_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  _log.info('Initialized');

  runApp(
    MyApp(
      persistance: LocalStoragePersistence(),
    ),
  );
}

Logger _log = Logger('main.dart');

class MyApp extends StatelessWidget {
  static final _router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const MainPage(key: Key('main')),
          routes: [
            GoRoute(
                path: 'firstPath',
                builder: (context, state) =>
                const FirstPathPage(key: Key('firstpathpage')),
                routes: [
                  GoRoute(
                    path: 'firstFirst',
                    builder: (context, state) =>
                    const FirstFirstPage(key: Key('firstfirstpp')),
                  ),
                  GoRoute(
                    path: 'firstSecond',
                    redirect: (context, state) {
                      if (state.extra == null) {
                        return '/';
                      }

                      return null;
                    },
                    builder: (context, state) =>
                    const FirstSecondPage(key: Key('firstsecondpp')),
                  )
                ]),
            GoRoute(
              path: 'secondpath',
              builder: (context, state) =>
              const SecondPathPage(key: Key('secondpath')),
            ),
          ]),
    ],
  );

  final Persistance persistance;

  const MyApp({
    required this.persistance,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppLifecycleObserver(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(
            create: (context) {
              var progress = UserProvider(persistance);
              progress.getTmpData();
              return progress;
            },
          ),
        ],
        child: Builder(builder: (context) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            routeInformationProvider: _router.routeInformationProvider,
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            scaffoldMessengerKey: scaffoldMessengerKey,
          );
        }),
      ),
    );
  }
}
