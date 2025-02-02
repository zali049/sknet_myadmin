import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sknet_myadmin/app/utils/constans.dart';
import 'package:sknet_myadmin/views/dashboard_pages/controller/dashboard_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final controller = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverAppBar(
              title: controller.isSliverAppBarExpanded.value
                  ? const Center(child: Text('Dasboard'))
                  : null,
              expandedHeight: controller.kExpandedHeight,
              backgroundColor: controller.isSliverAppBarExpanded.value
                  ? Colors.white
                  : Colors.blue,
              pinned: true,
              snap: false,
              floating: false,
              flexibleSpace: controller.isSliverAppBarExpanded.value
                  ? null
                  : Container(
                      height: 300,
                      width: Constans.deviceWidth,
                      padding: const EdgeInsets.all(16),
                      child: const Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                      "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp"),
                                  backgroundColor: Colors.transparent,
                                ),
                                SizedBox(width: 25,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Selamat Datang'),
                                    Text(
                                      "Rizal Ilmanudien",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (contex, i) => ListTile(
                  title: Text("Item Ke- ${i + 1}"),
                ),
                childCount: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
