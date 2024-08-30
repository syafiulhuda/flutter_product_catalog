import 'package:flutter/material.dart';
import 'package:flutter_consume_api/routes/routes.dart';

class App extends StatelessWidget {
  App({super.key});

  final routes = AppRoutes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routes.onRoute,
    );
  }
}
