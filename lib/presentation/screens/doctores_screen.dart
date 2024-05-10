import 'package:agenda/presentation/widgets/add_dialogs.dart';
import 'package:flutter/material.dart';

class DoctoresScreen extends StatelessWidget {

  static const name = "doctores_screen";

  const DoctoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(name),
      ),
      body: const Column(
        children: [
          AddContainer(),
          SizedBox(height: 13,),
          
        ],
      ),
    );
  }
}

class AddContainer extends StatelessWidget {
  const AddContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: Colors.grey.shade300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              child: Text("Listado de doctores", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 13),
              child: FilledButton.icon(
                onPressed: () {
                  AddDialogs.newDoctorDialog(context);
                }, 
                icon: const Icon(Icons.add_moderator_rounded),
                label: const Text("Añadir nuevo doctor")
              ),
            )
          ],
        ),
      ),
    );
  }
}