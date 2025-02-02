import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  _updateConnectionStatus(List<ConnectivityResult> connectivityResult) {
    // ignore: unrelated_type_equality_checks
    if (connectivityResult.contains(ConnectivityResult.none)) {
      Get.rawSnackbar(
        messageText: const Text(
          'No Internet Connection!',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        isDismissible: false,
        duration: const Duration(days: 1),
        backgroundColor: Colors.red,
        icon: const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
        margin: EdgeInsets.zero,
        snackStyle: SnackStyle.GROUNDED,
      );
    } else {
      if(Get.isSnackbarOpen){
        Get.closeCurrentSnackbar();
      }
    }
  }
}
