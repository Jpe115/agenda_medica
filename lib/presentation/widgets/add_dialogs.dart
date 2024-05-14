import 'package:agenda/presentation/providers/doctores/doctores_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:agenda/domain/entities/especialidad.dart';

class AddDialogs {

  static Future<dynamic> newDoctorDialog(BuildContext context, WidgetRef ref, List<Especialidad> especialidades) {
    String currentValue = especialidades.first.nombreEspecialidad;
    final TextEditingController nombreController = TextEditingController();
    final TextEditingController apellidoController = TextEditingController();

    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return showDialog<String?>(context: context, 
      builder: (context) {
        return(AlertDialog(
          title: const Text("Añadir"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Ingrese los datos del nuevo doctor.", style: textStyle.headlineSmall,),
                ),
                TextFormField(
                  controller: nombreController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  keyboardType: TextInputType.name,
                  maxLength: 30,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-ZáéíóúÁÉÍÓÚñÑ ]"))  ],
                ),
                TextFormField(
                  controller: apellidoController,
                  decoration: const InputDecoration(labelText: 'Apellidos'),
                  keyboardType: TextInputType.name,
                  maxLength: 40,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-ZáéíóúÁÉÍÓÚñÑ ]"))  ],
                ),
                Text("Especialidad", style: textStyle.bodyLarge,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: StatefulBuilder(builder: (context, setState) {
                    return DropdownButton<String>(
                      focusColor: Colors.transparent,
                      dropdownColor: colors.inversePrimary,
                      elevation: 4,
                      value: currentValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          currentValue = newValue!;
                        });
                      },
                      items: especialidades
                          .map<DropdownMenuItem<String>>((Especialidad value) {
                        return DropdownMenuItem<String>(
                          value: value.nombreEspecialidad,
                          child: Text(value.nombreEspecialidad),
                        );
                      }).toList(),
                    );
                  },),
                )
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
              final nombre = nombreController.text;
              final apellidos = apellidoController.text;
              final especialidad = currentValue;
              String especialidadId = especialidades.where((element) => element.nombreEspecialidad == especialidad).first.id.toString();

              ref.read(doctoresRepositoryProvider).addDoctor(nombre, apellidos, especialidadId);
              //TODO: guardar resultado
              Navigator.of(context).pop();
              }, child: const Text("Guardar")
            )
          ],
        ));
      },
    );
  }
  
  static Future<dynamic> newEspecialidadDialog(BuildContext context) {

    final textStyle = Theme.of(context).textTheme;

    return showDialog(context: context, 
      builder: (context) {
        return(AlertDialog(
          title: const Text("Añadir"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text("Ingrese el nombre de la nueva especialidad a ofrecer.", style: textStyle.headlineSmall,),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nombre de la especialidad'),
                  keyboardType: TextInputType.name,
                  maxLength: 50,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-ZáéíóúÁÉÍÓÚñÑ ]"))  ],
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

    final textStyle = Theme.of(context).textTheme;

    return showDialog(context: context, 
      builder: (context) {
        return(AlertDialog(
          title: const Text("Añadir"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Text("Ingrese los datos del paciente." , style: textStyle.headlineSmall,),
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