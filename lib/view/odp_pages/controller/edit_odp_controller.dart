import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sknet_myadmin/view/odp_pages/controller/odp_controller.dart';
import 'package:sknet_myadmin/models/odp/odp_model.dart';
import 'package:sknet_myadmin/repository/odp_repo.dart';

class EditOdpController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    valueForm();
  }

  @override
  void dispose() {
    super.dispose();
    cNama.dispose();
    cKode.dispose();
    cAlamat.dispose();
    cLong.dispose();
    cLat.dispose();
    cNoFeeder.dispose();
    cTube.dispose();
    cCore.dispose();
    cFeederOut.dispose();
    cRtoSplitter.dispose();
    cRedOut.dispose();
    cBlueOut.dispose();
    cSplitter.dispose();
    cSplitOut.dispose();
    cKeterangan.dispose();
  }

  final OdpController controller = Get.find();
  final Rx<OdpModel> odp = Get.arguments;

  final OdpService _odpService = OdpService();
  final formKey = GlobalKey<FormState>();

  final TextEditingController cNama = TextEditingController();
  final TextEditingController cKode = TextEditingController(text: 'SK-ODP-');
  final TextEditingController cAlamat = TextEditingController();
  final TextEditingController cLong = TextEditingController();
  final TextEditingController cLat = TextEditingController();
  final TextEditingController cNoFeeder = TextEditingController();
  final TextEditingController cTube = TextEditingController();
  final TextEditingController cCore = TextEditingController();
  final TextEditingController cFeederOut = TextEditingController();
  final TextEditingController cRtoSplitter = TextEditingController();
  final TextEditingController cRedOut = TextEditingController();
  final TextEditingController cBlueOut = TextEditingController();
  final TextEditingController cSplitter = TextEditingController();
  final TextEditingController cSplitOut = TextEditingController();
  final TextEditingController cKeterangan = TextEditingController();

  String? validatorForm(String? value) {
    if (value!.isNotEmpty) {
      return null;
    } else {
      return 'form tidak boleh kosong';
    }
  }

  // Future<void> sendDataOdp() async {
  //
  //   try {
  //     final response = await _odpService.createOdps(data);
  //     if (response == true) {
  //       Get.snackbar("Seccess", 'Data berhasil disimpan');
  //       Get.delete<AddOdpController>();
  //       controller.getOdpsAll();
  //     } else {
  //       Get.snackbar("Gagal", 'Data Gagal disimpan');
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   }
  // }

  OdpModel valueForm() {
    
    cNama.text = odp.value.namaOdp ?? "";
    cKode.text = odp.value.kodeOdp ?? "";
    cAlamat.text = odp.value.addressOdp ?? "";
    cLong.text = odp.value.longitude ?? "";
    cLat.text = odp.value.latitude ?? "";
    cNoFeeder.text = odp.value.noFeeder ?? "";
    cFeederOut.text = odp.value.feederOut ?? "";
    cTube.text = odp.value.tube ?? "";
    cCore.text = odp.value.core ?? "";
    cRtoSplitter.text = odp.value.ratioSplitter ?? "";
    cRedOut.text = odp.value.ratioSplitRed ?? "";
    cBlueOut.text = odp.value.ratioSplitBlue ?? "";
    cSplitter.text = odp.value.splitter ?? "";
    cSplitOut.text = odp.value.splitterOut ?? "";
    cKeterangan.text = odp.value.keterangan ?? "";
    return odp.value;
  }

  Future<bool?> updateData(int id) async {
    var data = OdpModel(
        id: id.toString(),
        namaOdp: cNama.text,
        kodeOdp: cKode.text,
        addressOdp: cAlamat.text,
        longitude: cLong.text,
        latitude: cLat.text,
        noFeeder: cNoFeeder.text,
        tube: cTube.text,
        core: cCore.text,
        feederOut: cFeederOut.text,
        ratioSplitter: cRtoSplitter.text,
        ratioSplitRed: cRedOut.text,
        ratioSplitBlue: cBlueOut.text,
        splitter: cSplitter.text,
        splitterOut: cSplitOut.text,
        keterangan: cKeterangan.text);
    final response = await _odpService.updateOdp(id, data);
    try {
      if (response == true) {
        controller.getOdpsAll();
      } else {
        _odpService.message = response.toString();
      }
    } catch (e) {
      print(e);
    }
    return response;
  }
}
