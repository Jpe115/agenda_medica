import 'package:agenda/presentation/providers/doctores/doctores_repository_provider.dart';
import 'package:agenda/presentation/providers/especialidades/especialidades_repository_provider.dart';
import 'package:agenda/presentation/providers/pacientes/pacientes_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteDialogs {

  static Future<dynamic> deleteDoctorDialog(BuildContext context, WidgetRef ref, int doctorId) {
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
              ref.read(doctoresRepositoryProvider).deleteDoctor(doctorId);
              Navigator.of(context).pop();
              }, child: const Text("Eliminar")
            )
          ],
        ));
      },
    );
  }
  
  static Future<dynamic> deleteEspecialidadDialog(BuildContext context, WidgetRef ref, int especialidadId) {
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
              ref.read(especialidadesRepositoryprovider).deleteEspecialidad(especialidadId);
              Navigator.of(context).pop();
              }, child: const Text("Eliminar")
            )
          ],
        ));
      },
    );
  }
  
  static Future<dynamic> deletePacienteDialog(BuildContext context, WidgetRef ref, int pacienteId) {
    return showDialog(context: context, 
      builder: (context) {
        return(AlertDialog(
          title: const Text("Eliminar paciente"),
          content: const Text("¿Está seguro que desea eliminar al paciente seleccionado?"),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            
            FilledButton(onPressed: () {
              ref.read(pacientesRepositoryProvider).deletepaciente(pacienteId);
              Navigator.of(context).pop();
              }, child: const Text("Eliminar")
            )
          ],
        ));
      },
    );
  }

}