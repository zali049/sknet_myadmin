import 'package:flutter/material.dart';
import 'package:sknet_myadmin/utils/constans.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            backgroundColor: Colors.blue,
            pinned: true,
            flexibleSpace: Container(
              height: Constans.blockHeight,
              width: Constans.blockWidth,
              padding: const EdgeInsets.all(8),
              child: const Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp"),
                          backgroundColor: Colors.transparent,
                        ),
                        Text(
                          "Rizal Ilmanudien",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
    );
  }
}
