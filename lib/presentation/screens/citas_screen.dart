import 'package:flutter/material.dart';

class CitasScreen extends StatelessWidget {

  static const name = "citas_screen";

  const CitasScreen({super.key});

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