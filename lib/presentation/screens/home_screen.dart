import 'package:flutter/material.dart';
import 'package:agenda/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const name = "home_screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(name),
      ),
      body: Center(
        child: Column(
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FilledButton(onPressed: (){
              AddDialogs.newDoctorDialog(context);
              }, child: const Text("Añadir doctor")
            )
          ],
        ),
      ),
    );
  }
}