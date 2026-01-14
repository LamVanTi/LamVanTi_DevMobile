import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/* ---------------- APP ROOT ---------------- */
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chapter 3 - Basic Widgets',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        isDarkMode: isDarkMode,
        onToggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
    );
  }
}

/* ---------------- HOME PAGE ---------------- */
class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Widgets Demo', style: TextStyle(color: Colors.blue),), centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* TITLE */
            Text(
              'Dark / Light Mode',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 16),
            /*IMG*/
            Image.asset(
              'assets/img.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const Spacer(),
            Image.asset(
              'assets/images.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const Spacer(),
            /* ROW */
            Row(
              children: const [
                Icon(Icons.widgets),
                SizedBox(width: 8),
                Text('Basic Flutter Widgets'),
              ],
            ),



            const SizedBox(height: 20),

            /* CUSTOM WIDGET */
            Text(
              'Category Cards',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 12),

            CategoryCard(
              title: 'Technology',
              icon: Icons.computer,
              color: Colors.blue,
            ),
            CategoryCard(
              title: 'Food',
              icon: Icons.fastfood,
              color: Colors.orange,
            ),
            CategoryCard(
              title: 'Travel',
              icon: Icons.flight,
              color: Colors.green,
            ),

            const Spacer(),


            /* NAVIGATION BUTTON */
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  elevation: 6,
                  shadowColor: Colors.blue.withOpacity(0.5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SecondPage(),
                    ),
                  );
                },
                child: const Text(
                  'Go to Second Page',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------- CUSTOM WIDGET ---------------- */
class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------- SECOND PAGE ---------------- */
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: const Center(
        child: Text(
          'Navigator demo',
          style: TextStyle(fontSize: 20),
        ),

      ),

    );
  }
}
