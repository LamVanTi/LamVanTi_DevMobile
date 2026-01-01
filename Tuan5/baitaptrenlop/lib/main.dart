import 'package:flutter/material.dart';
import 'screens/column_screen.dart';
import 'screens/lazy_load.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Column & Lazy Load',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Column & Lazy Load"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          ListTile(
            title: const Text("Column"),
            subtitle: const Text("Arranges elements vertically"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ColumnScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Lazy Load"),
            subtitle: const Text("Lazy loading list items"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LazyLoadScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
