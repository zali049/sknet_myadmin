import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sknet_myadmin/pages/customer.dart';
import 'package:sknet_myadmin/pages/odp_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Dashboard"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Get.to(OdpPage()),
                child: const Text("Page Odp")),
            ElevatedButton(
                onPressed: () => Get.to(CustomerPage()),
                child: const Text("Page Customer")),
          ],
        ),
      ),
    );
  }
}
