import 'package:flutter/material.dart';

class DoctoresScreen extends StatelessWidget {

  static const name = "doctores_screen";

  const DoctoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(name),
      ),
      body: const Placeholder(),
    );
  }
}