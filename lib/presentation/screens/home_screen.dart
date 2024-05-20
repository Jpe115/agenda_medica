import 'package:flutter/material.dart';

import 'package:agenda/presentation/widgets/side_menu.dart';

class HomeScreen extends StatefulWidget {
  static const name = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: const Center(child: Text("Bienvenido"),),
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
