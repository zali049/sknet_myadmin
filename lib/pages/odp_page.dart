import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sknet_myadmin/controllers/odp_controller.dart';

class OdpPage extends StatelessWidget {
  OdpPage({super.key});
  final OdpController odpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('ODP'),
        ),
      ),
      body: Obx(
        () => odpController.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: ListView.builder(
                  itemCount: odpController.odps.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('/odp_detail', arguments: odpController.odps[index]);
                      },
                      child: Card(
                        child: SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  odpController.odps[index].kodeOdp!,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(odpController.odps[index].namaOdp!),
                                Text(odpController.odps[index].noFeeder!)
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
