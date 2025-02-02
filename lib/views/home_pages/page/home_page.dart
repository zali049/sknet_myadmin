import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sknet_myadmin/routes/app_name.dart';
import 'package:sknet_myadmin/routes/app_route.dart';
import 'package:sknet_myadmin/views/home_pages/controller/home_controller.dart';
import 'package:sknet_myadmin/views/widgets/bottom_navbar.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Navigator(
            key: Get.nestedKey(1),
            initialRoute: RouteName.DASHBOARD_PAGE,
            onGenerateRoute: AppRoute.onGenerateRoute,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () {
                controller.pages[controller.currentIndex.value];
                return CustomBottomNavbar(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.selectedItem(0);
                      },
                      icon: const Icon(Icons.home),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.selectedItem(1);
                      },
                      icon: const Icon(Icons.select_all_rounded),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.selectedItem(2);
                      },
                      icon: const Icon(Icons.home),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
