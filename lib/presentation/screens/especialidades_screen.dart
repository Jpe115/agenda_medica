import 'package:flutter/material.dart';

class EspecialidadesScreen extends StatelessWidget {

  static const name = "especialidades_screen";

  const EspecialidadesScreen({super.key});

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