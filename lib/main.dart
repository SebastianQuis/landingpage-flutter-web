import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:landing_page/providers/pageview_provider.dart';
import 'package:landing_page/router/router.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageViewProvider(),),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing page',
      debugShowCheckedModeBanner: false,
      initialRoute: '/about',
      onGenerateRoute: Flurorouter.router.generator,
    );
  }
}