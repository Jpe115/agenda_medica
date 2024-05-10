import 'package:flutter/material.dart';

class DeleteDialogs {

  static Future<dynamic> deleteDoctorDialog(BuildContext context) {
    return showDialog(context: context, 
      builder: (context) {
        return(AlertDialog(
          title: const Text("Form"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                const Text("Lorem ut incididunt ea occaecat. Pariatur ullamco consequat ea in consectetur voluptate ut do et ut laborum proident. Laboris reprehenderit mollit duis consequat proident. Sit minim cupidatat magna dolor ad qui cillum sint duis anim nisi consequat magna dolor. Nostrud velit mollit cupidatat irure commodo irure aute laborum ipsum sit nostrud sit irure sunt. Eu ad reprehenderit ea dolore ullamco proident non anim. Sit reprehenderit sint est ipsum laborum do velit anim amet excepteur laboris adipisicing mollit."),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Apellido'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Especialidad'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            
            FilledButton(onPressed: () {
              Navigator.of(context).pop();
              }, child: const Text("Guardar")
            )
          ],
        ));
      },
    );
  }

}