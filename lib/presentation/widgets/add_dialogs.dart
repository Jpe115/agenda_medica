import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddDialogs {

  static Future<dynamic> newDoctorDialog(BuildContext context) {
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
  
  static Future<dynamic> newEspecialidadDialog(BuildContext context) {
    return showDialog(context: context, 
      builder: (context) {
        return(AlertDialog(
          title: const Text("Form"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                const Text("Lorem ut incididunt ea occaecat. Pariatur ullamco consequat ea in consectetur voluptate ut do et ut laborum proident. Laboris reprehenderit mollit duis consequat proident. Sit minim cupidatat magna dolor ad qui cillum sint duis anim nisi consequat magna dolor. Nostrud velit mollit cupidatat irure commodo irure aute laborum ipsum sit nostrud sit irure sunt. Eu ad reprehenderit ea dolore ullamco proident non anim. Sit reprehenderit sint est ipsum laborum do velit anim amet excepteur laboris adipisicing mollit."),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nombre de la especialidad'),
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

  static Future<dynamic> newPacienteDialog(BuildContext context) {
    return showDialog(context: context, 
      builder: (context) {
        return(AlertDialog(
          title: const Text("Form"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70),
                  child: Text("Ingrese los datos del paciente."),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  keyboardType: TextInputType.name,
                  maxLength: 30,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-ZáéíóúÁÉÍÓÚñÑ ]"))  ],
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Apellidos'),
                  keyboardType: TextInputType.name,
                  maxLength: 40,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-ZáéíóúÁÉÍÓÚñÑ ]"))  ],
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Edad'),
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Teléfono'),
                  keyboardType: TextInputType.phone,
                  maxLength: 13,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Correo'),
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 60,
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