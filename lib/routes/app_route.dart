import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sknet_myadmin/views/customer_pages/customer.dart';
import 'package:sknet_myadmin/views/dashboard_pages/binding/dashboard_bindings.dart';
import 'package:sknet_myadmin/views/home_pages/binding/home_page_bindings.dart';
import 'package:sknet_myadmin/views/odp_pages/binding/add_odp_page_bindings.dart';
import 'package:sknet_myadmin/views/odp_pages/binding/edit_odp_page_bindings.dart';
import 'package:sknet_myadmin/views/odp_pages/page/add_odp.dart';
import 'package:sknet_myadmin/views/odp_pages/page/edit_odp.dart';
import 'package:sknet_myadmin/routes/app_name.dart';
import '../views/dashboard_pages/page/dashboard_page.dart';
import '../views/home_pages/page/home_page.dart';
import '../views/odp_pages/binding/odp_page_bindings.dart';
import '../views/odp_pages/page/odp_detail.dart';
import '../views/odp_pages/page/odp_page.dart';

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

  static Route? onGenerateRoute(RouteSettings setting) {
    if (setting.name == RouteName.DASHBOARD_PAGE) {
      return GetPageRoute(
          settings: setting,
          page: () => const DashboardPage(),
          binding: DashboardBindings());
    }

    if (setting.name == RouteName.ODP_PAGE) {
      return GetPageRoute(
        settings: setting,
        page: () => OdpPage(),
        binding: OdpPageBindings(),
      );
    }

    if (setting.name == RouteName.CUST_PAGE) {
      return GetPageRoute(
        settings: setting,
        page: () => const CustomerPage(),
      );
    }
    return null;
  }
}
