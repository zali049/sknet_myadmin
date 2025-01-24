import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sknet_myadmin/view/odp_pages/controller/odp_controller.dart';
import 'package:sknet_myadmin/view/odp_pages/page/add_odp.dart';
import 'package:sknet_myadmin/view/widgets/custom_button.dart';

import '../../../routes/app_name.dart';

class OdpPage extends StatelessWidget {
  OdpPage({super.key});

  final odpController = Get.find<OdpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 100),
          child: Text('ODP'),
        ),
      ),
      body: Obx(
        () => odpController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: RefreshIndicator(
                  onRefresh: odpController.handleRefresh,
                  child: ListView.builder(
                    itemCount: odpController.listOdp.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteName.ODP_DETAIL_PAGE,
                              arguments: odpController.listOdp[index]);
                        },
                        onLongPress: () {
                          Get.dialog(Dialog(
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Delete",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              "${odpController.listOdp[index].namaOdp}"),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomButton(
                                          action: () => Get.back(),
                                          label: "No",
                                          colorsBackground: Colors.blue,
                                        ),
                                        const SizedBox(width: 10),
                                        CustomButton(
                                          action: () {
                                            String? value =
                                                odpController.listOdp[index].id;
                                            int valueIndex =
                                                int.parse(value ?? "0");
                                            odpController
                                                .deleteItemOdp(valueIndex);
                                            Get.back();
                                          },
                                          label: "Yes",
                                          colorsBackground: Colors.red,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                        },
                        child: Card(
                          child: SizedBox(
                            height: 90,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    odpController.listOdp[index].namaOdp ?? "",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    odpController.listOdp[index].kodeOdp ?? "",
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.blue),
                                  ),
                                  Text(odpController.listOdp[index].addressOdp ??
                                      "")
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            useSafeArea: true,
            isScrollControlled: true,
            isDismissible: true,
            context: context,
            builder: (context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: AddOdp(),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
