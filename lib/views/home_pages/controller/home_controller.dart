import 'package:get/get.dart';
import '../../../routes/app_name.dart';


class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var currentIndex = 0.obs;

  final pages = [RouteName.DASHBOARD_PAGE, RouteName.ODP_PAGE, RouteName.CUST_PAGE];

  void selectedItem(int index) {
    currentIndex.value = index;
    Get.offAllNamed(pages[index], id: 1);
  }

  
}
