import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Пошук міста")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Повернутися назад (на головну)
            context.go('/');
          },
          child: const Text("Назад на головну"),
        ),
      ),
    );
  }
}