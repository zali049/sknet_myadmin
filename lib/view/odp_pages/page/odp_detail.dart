import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:sknet_myadmin/models/odp/odp_model.dart';
import 'package:sknet_myadmin/view/odp_pages/controller/odp_controller.dart';
import 'package:sknet_myadmin/view/widgets/custom_card.dart';
import 'package:sknet_myadmin/view/widgets/custom_maps.dart';

import '../../../routes/app_name.dart';

class OdpDetailPage extends StatefulWidget {
  const OdpDetailPage({super.key});

  @override
  State<OdpDetailPage> createState() => _OdpDetailPageState();
}

class _OdpDetailPageState extends State<OdpDetailPage> {
  final OdpModel _odpModel = Get.arguments;
  final odpC = Get.find<OdpController>();
  final DraggableScrollableController sheetController =
      DraggableScrollableController();
  double? _markerSize;
  bool selected = false;

  @override
  void initState() {
    super.initState();
    _markerSize = 50;
  }

  void _updateSizeMarker(double zoom) {
    setState(() {
      _markerSize = (28.0 * (zoom / 9.5));
    });
  }

  @override
  Widget build(BuildContext context) {
    final Rx<OdpModel> odp = _odpModel.obs;
    double latitude = double.parse(odp.value.latitude ?? "0.0");
    double longitude = double.parse(odp.value.longitude ?? "0.0");
    LatLng center = LatLng(latitude, longitude);
    double widthDevice = MediaQuery.of(context).size.width;
    double heigthDevice = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    width: widthDevice,
                    height: selected ? heigthDevice : heigthDevice * 0.40,
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 300),
                    child: GestureDetector(
                      child: CustomMaps(
                        options: MapOptions(
                          minZoom: 10.0,
                          maxZoom: 18.0,
                          initialCenter: center,
                          initialZoom: 16,
                          onPositionChanged: (camera, hasGesture) {
                            if (hasGesture) {
                              _updateSizeMarker(camera.zoom);
                            }
                          },
                          interactionOptions: const InteractionOptions(
                              flags: InteractiveFlag.drag |
                                  InteractiveFlag.pinchZoom),
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'my.id.zalidev.sknetadmin',
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: center,
                                alignment: Alignment.center,
                                rotate: false,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      bottom: 15,
                                      child: Icon(
                                        Icons.location_pin,
                                        size: _markerSize,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 56,
              left: 16,
              right: 16,
              child: SizedBox(
                width: widthDevice,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => Get.back(),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 45,
                      width: 240,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                            child: Text(
                          "${odp.value.namaOdp}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        )),
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                      child: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white),
                        onPressed: () {
                          Get.toNamed(RouteName.ODP_EDIT_PAGE, arguments: odp);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            NotificationListener<DraggableScrollableNotification>(
              onNotification: (DraggableScrollableNotification? notification) {
                if (selected && notification!.extent >= 0.6) {
                  setState(() {
                    selected = false;
                  });
                } else if (!selected && notification!.extent < 0.6) {
                  setState(() {
                    selected = true;
                  });
                }
                return selected;
              },
              child: DraggableScrollableSheet(
                controller: sheetController,
                snap: true,
                expand: true,
                shouldCloseOnMinExtent: false,
                snapSizes: const [0.7],
                maxChildSize: 0.7,
                initialChildSize: 0.7,
                builder: (BuildContext context, scroolController) {
                  return Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  8.0, 70.0, 8.0, 8.0),
                              child: StaggeredGrid.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                axisDirection: AxisDirection.down,
                                children: [
                                  CustomCard(
                                    title: "KODE ODP",
                                    decription: odp.value.kodeOdp,
                                  ),
                                  CustomCard(
                                    title: "Alamat ODP",
                                    decription: odp.value.addressOdp,
                                  ),
                                  CustomCard(
                                    width: 2.0,
                                    title: "FEEDER",
                                    decription: odp.value.noFeeder,
                                  ),
                                  CustomCard(
                                    title: "FEEDER OUT",
                                    decription: "${odp.value.feederOut}.dBm",
                                  ),
                                  CustomCard(
                                    title: "RATIO SPLITTER",
                                    decription: odp.value.ratioSplitter,
                                  ),
                                  CustomCard(
                                    title: "TUBE",
                                    decription: "${odp.value.tube}",
                                  ),
                                  CustomCard(
                                    backgrounColor: Colors.white,
                                    title: "CORE",
                                    decription: odp.value.core,
                                  ),
                                  CustomCard(
                                    title: "RATIO RED OUT",
                                    decription:
                                        "${odp.value.ratioSplitRed}.dBm",
                                  ),
                                  CustomCard(
                                    title: "RATIO BLUE OUT",
                                    decription:
                                        "${odp.value.ratioSplitBlue}.dBm",
                                  ),
                                  CustomCard(
                                    title: "RATIO BLUE OUT",
                                    decription:
                                        "${odp.value.ratioSplitBlue}.dBm",
                                  ),
                                  CustomCard(
                                    title: "RATIO BLUE OUT",
                                    decription:
                                        "${odp.value.ratioSplitBlue}.dBm",
                                  ),
                                  CustomCard(
                                    title: "RATIO BLUE OUT",
                                    decription:
                                        "${odp.value.ratioSplitBlue}.dBm",
                                  ),
                                  CustomCard(
                                    title: "KETERANGAN",
                                    decription: odp.value.keterangan,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          controller: scroolController,
                          child: Container(
                            height: 70,
                            width: double.infinity,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 8.0),
                                  width: 50.0,
                                  height: 4.0,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "${odp.value.namaOdp}",
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Divider(
                                  height: 1,
                                  indent: 10,
                                  endIndent: 10,
                                  color: Colors.grey.shade100,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
