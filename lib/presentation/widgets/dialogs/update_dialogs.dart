import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:agenda/domain/entities/doctor.dart';
import 'package:agenda/domain/entities/especialidad.dart';
import 'package:agenda/presentation/providers/doctores/doctores_repository_provider.dart';

class UpdateDialogs {

  static Future<dynamic> updateDoctorDialog(BuildContext context, WidgetRef ref, List<Especialidad> especialidades, Doctor doctor) {
    String currentEspecialidad = doctor.especialidad;
    final TextEditingController nombreController = TextEditingController(text: doctor.nombre);
    final TextEditingController apellidoController = TextEditingController(text: doctor.apellidos);

    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return showDialog<String?>(context: context, 
      builder: (context) {
        return(AlertDialog(
          title: const Text("Editar"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Ingrese los datos actualizados del doctor.", style: textStyle.headlineSmall,),
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
                      value: currentEspecialidad,
                      onChanged: (String? newValue) {
                        setState(() {
                          currentEspecialidad = newValue!;
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
                //TODO: enviar false
              },
            ),
            
            FilledButton(onPressed: () {
              final nombre = nombreController.text;
              final apellidos = apellidoController.text;
              final especialidad = currentEspecialidad;
              String especialidadId = especialidades.where((element) => element.nombreEspecialidad == especialidad).first.id.toString();

              if (nombre.length <= 2 || apellidos.length <= 2) {
                Navigator.of(context).pop();
              } 
              else {
                ref.read(doctoresRepositoryProvider).addDoctor(nombre, apellidos, especialidadId);
                Navigator.of(context).pop();
              }
              
              //TODO: guardar resultado pyresponse
              }, child: const Text("Guardar")
            )
          ],
        ));
      },
    );
  }

}