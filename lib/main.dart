import 'package:flutter/material.dart';
import 'package:riven/modules/home/presenter/views/loading.dart';
import 'package:riven/shared/presentation/styles/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riven',
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoadingScreen(),
      },
    );
  }
}
