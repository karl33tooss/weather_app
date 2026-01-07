import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Тут буде погода"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // GoRouter. Ми кажемо "Йди на /search"
                context.go('/search');
              },
              child: const Text("Знайти місто"),
            ),
          ],
        ),
      ),
    );
  }
}