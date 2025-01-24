import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../routes/app_name.dart';
import '../../dashboard_pages/dashboard_pages.dart';
import '../../odp_pages/binding/odp_page_bindings.dart';
import '../../odp_pages/page/odp_page.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var currentIndex = 0.obs;

  final pages = [RouteName.DASHBOARD_PAGE, RouteName.ODP_PAGE];

  void selectedItem(int index) {
    currentIndex.value = index;
    Get.offAllNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings setting) {
    if (setting.name == RouteName.DASHBOARD_PAGE) {
      return GetPageRoute(
        settings: setting,
        page: () => const DashboardPage(),
      );
    }
    
    if (setting.name == RouteName.ODP_PAGE) {
      return GetPageRoute(
        settings: setting,
        page: () => OdpPage(),
        binding: OdpPageBindings(),
      );
    }
    return null;
  }
}
