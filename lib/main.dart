import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:riven/modules/builds/presentation/views/build.dart';
import 'package:riven/modules/home/presentation/views/home.dart';
import 'package:riven/modules/home/presentation/views/loading.dart';
import 'package:riven/shared/domain/entities/build_set.dart';
import 'package:riven/shared/presentation/styles/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  final routeObserver = Get.put<RouteObserver>(
    RouteObserver<PageRoute>(),
  );
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BuildSet>(
          create: (_) => BuildSet(),
        ),
      ],
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: MaterialApp(
          title: 'Riven',
          theme: darkTheme,
          debugShowCheckedModeBanner: false,
          navigatorObservers: [
            routeObserver,
          ],
          routes: {
            '/': (context) => const LoadingScreen(),
            '/home': (context) => const HomeScreen(),
            '/build': (context) => const BuildScreen()
          },
        ),
      ),
    );
  }
}
