import 'package:flutter/material.dart';

class LazyLoadScreen extends StatelessWidget {
  const LazyLoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lazy Load List"),
      ),
      body: ListView.builder(
        itemCount: 1000,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.list),
              title: Text("Item ${index + 1}"),
              subtitle: const Text("Loaded lazily"),
            ),
          );
        },
      ),
    );
  }
}
