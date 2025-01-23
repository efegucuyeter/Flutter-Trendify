import 'package:flutter/material.dart';
import 'core/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Trendify',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}