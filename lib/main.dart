import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sknet_myadmin/core/dependency_injection.dart';
import 'package:sknet_myadmin/pages/odp_detail.dart';
import '../pages/home_page.dart';
import '../pages/odp_page.dart';

Future<void> main() async {
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(
          name: '/odp_page',
          page: () => OdpPage(),
        ),
        GetPage(
          name: '/odp_detail',
          page: () => OdpDetailPage(),
        ),
      ],
    );
  }
}
