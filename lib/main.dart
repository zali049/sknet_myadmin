import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sknet_myadmin/routes/app_route.dart';
import 'routes/app_name.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      initialRoute: RouteName.HOME_PAGE,
      getPages: AppRoute.pages,
      defaultTransition: Transition.fadeIn,
    );
  }
}
