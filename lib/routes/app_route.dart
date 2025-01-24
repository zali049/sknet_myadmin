
import 'package:get/get.dart';
import 'package:sknet_myadmin/view/home_pages/binding/home_page_bindings.dart';
import 'package:sknet_myadmin/view/odp_pages/binding/add_odp_page_bindings.dart';
import 'package:sknet_myadmin/view/odp_pages/binding/edit_odp_page_bindings.dart';
import 'package:sknet_myadmin/view/odp_pages/page/add_odp.dart';
import 'package:sknet_myadmin/view/odp_pages/page/edit_odp.dart';
import 'package:sknet_myadmin/routes/app_name.dart';
import '../view/home_pages/page/home_page.dart';
import '../view/odp_pages/page/odp_detail.dart';


class AppRoute {
  static final pages = [
    GetPage(
      name: RouteName.HOME_PAGE,
      page: () => const HomePage(),
      binding: HomePageBindings(),
    ),
  
    GetPage(
      name: RouteName.ODP_DETAIL_PAGE,
      page: () => const OdpDetailPage(),
    ),
    GetPage(
      name: RouteName.ODP_ADD_PAGE,
      page: () => const AddOdp(),
      binding: AddOdpPageBindings(),
    ),
    GetPage(
      name: RouteName.ODP_EDIT_PAGE,
      page: () => const EditOdp(),
      binding: EditOdpPageBindings(),
    ),
  ];

  
}
