import 'package:flutter/material.dart';
import 'package:flutter_consume_api/widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ! Routes
    final List<Map<String, String>> routes = [
      {"name": "Get Single Product View", "route": "/getSingleProductView"},
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        widget: Text(
          "Home Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (context, index) {
          final route = routes[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                route["route"]!,
              );
            },
            child: Column(
              children: [
                ListTile(
                  title: Text(route["name"]!),
                ),
                const Divider(height: 5),
              ],
            ),
          );
        },
      ),
    );
  }
}
