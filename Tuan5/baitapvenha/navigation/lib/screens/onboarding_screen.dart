import 'package:flutter/material.dart';
import '../models/onboarding_model.dart';
import '../widgets/onboarding_page.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int index = 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      title: 'Easy Time Management',
      desc: 'Manage your tasks easily based on priority.',
      icon: Icons.schedule,
    ),
    OnboardingModel(
      title: 'Increase Work Effectiveness',
      desc: 'Track progress and improve productivity.',
      icon: Icons.bar_chart,
    ),
    OnboardingModel(
      title: 'Reminder Notification',
      desc: 'Get notified before deadlines.',
      icon: Icons.notifications_active,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
                child: const Text('Skip'),
              ),
            ),

            // Pages
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (i) => setState(() => index = i),
                itemBuilder: (_, i) => OnboardingPage(data: pages[i]),
              ),
            ),

            // Bottom buttons
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  if (index > 0)
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                    ),

                  const Spacer(),

                  SizedBox(
                    width: 160,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        if (index == pages.length - 1) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()),
                          );
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                      child: Text(
                        index == pages.length - 1
                            ? 'Get Started'
                            : 'Next',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
