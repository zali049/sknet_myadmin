import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sknet_myadmin/http_api/base_response.dart';
import 'package:sknet_myadmin/http_api/http_api.dart';
import 'package:sknet_myadmin/models/odp_model.dart';

class OdpService {
  final ApiClient _apiClient = ApiClient();
  String message = "";

  Future<List<OdpModel>> getOdps() async {
    final response = await _apiClient.getOdp();
    List<OdpModel> listOdp = <OdpModel>[];
    try {
      if (response.status == true) {
        listOdp = response.data!;
      } else {
        message = response.messages ?? "";
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return listOdp;
  }

  Future<bool> createOdps(OdpModel model) async {
    try {
      final res = await _apiClient.addOdp(model);
      return res.status ?? false;
    } catch (e) {
      return false;
    }
  }
}
