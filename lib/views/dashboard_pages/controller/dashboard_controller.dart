import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final ScrollController scrollController = ScrollController();
  double kExpandedHeight = 300.0;
  RxBool isSliverAppBarExpanded = false.obs;

  @override
  void onInit() {
    super.onInit();
    isSliverExpand();
  }

  void isSliverExpand() {
    scrollController.addListener(() {
      isSliverAppBarExpanded.value = scrollController.hasClients &&
          scrollController.offset > (kExpandedHeight - kToolbarHeight);
    });
  }
}
