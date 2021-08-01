import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riven/modules/home/presentation/views/loading.dart';
import 'package:riven/shared/domain/entities/build_set.dart';
import 'package:riven/shared/presentation/styles/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BuildSet>(
          create: (_) => BuildSet(),
        ),
      ],
      child: MaterialApp(
        title: 'Riven',
        theme: darkTheme,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => LoadingScreen(),
        },
      ),
    );
  }
}
