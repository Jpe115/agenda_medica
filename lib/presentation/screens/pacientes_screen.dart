import 'package:flutter/material.dart';

class PacientesScreen extends StatelessWidget {

  static const name = "pacientes_screen";

  const PacientesScreen({super.key});

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