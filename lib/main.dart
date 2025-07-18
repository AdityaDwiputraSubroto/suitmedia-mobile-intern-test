import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'routes/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.initial,
      getPages: AppRoute.routes,
      title: "Suitmedia intern test",
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        useMaterial3: true,
      ),
    );
  }
}
