

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sknet_myadmin/models/odp_model.dart';

class OdpDetailPage extends StatelessWidget {
  OdpDetailPage({super.key});

  final OdpModel odp = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${odp.namaOdp}')
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama Odp : ${odp.namaOdp}"),
            Text("Kode ODP : ${odp.kodeOdp}"),
            Text("Alamat : ${odp.addressOdp}"),
            Text("Core : ${odp.core}"),
            Text("No Feeder : ${odp.noFeeder}"),
            Text("Tube : ${odp.tube}"), 
            Text("Ratio Splitter : ${odp.ratioSplitter}"),
            Text("Ratio Out Blue : ${odp.ratioSplitBlue}.dBm"),
            Text("Ratio Out Red : ${odp.ratioSplitRed}.dBm"),
            Text("Splitter : ${odp.splitter}"),
            Text("Splitter out : ${odp.splitterOut}.dBm"),
            Text("Keterangan : ${odp.keterangan}"),
        
           
          ],
        ),
      ),
    );
  }
}