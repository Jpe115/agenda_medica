import 'package:flutter/material.dart';

class DeleteDialogs {

  static Future<dynamic> deleteDoctorDialog(BuildContext context) {
    return showDialog(context: context, 
      builder: (context) {
        return(AlertDialog(
          title: const Text("Eliminar doctor"),
          content: const Text("¿Está seguro que desea eliminar al doctor seleccionado?"),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            
            FilledButton(onPressed: () {
              Navigator.of(context).pop();
              }, child: const Text("Eliminar")
            )
          ],
        ));
      },
    );
  }
  
  static Future<dynamic> deleteEspecialidadDialog(BuildContext context) {
    return showDialog(context: context, 
      builder: (context) {
        return(AlertDialog(
          title: const Text("Eliminar especialidad"),
          content: const Text("¿Está seguro que desea eliminar la especialidad seleccionado?"),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            
            FilledButton(onPressed: () {
              Navigator.of(context).pop();
              }, child: const Text("Eliminar")
            )
          ],
        ));
      },
    );
  }

}