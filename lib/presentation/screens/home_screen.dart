import 'package:flutter/material.dart';

import 'package:agenda/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {

  static const name = "home_screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(name),
      ),
      body: const Center(
        child: Column(
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("hola mundo")
          ],
        ),
      ),
      drawer: SideMenu(scaffoldKey: scaffoldKey,),
    );
  }
}