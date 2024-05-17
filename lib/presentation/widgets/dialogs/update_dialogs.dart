import 'package:agenda/config/helpers/formatos.dart';
import 'package:agenda/domain/entities/cita.dart';
import 'package:agenda/domain/entities/paciente.dart';
import 'package:agenda/presentation/providers/citas/citas_repository_provider.dart';
import 'package:agenda/presentation/providers/especialidades/especialidades_repository_provider.dart';
import 'package:agenda/presentation/providers/pacientes/pacientes_repository_provider.dart';
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

    final String initialNombre = doctor.nombre;
    final String initialApellidos = doctor.apellidos;
    final String initialEspecialidadId = doctor.especialidadId.toString();

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
                if (initialNombre != nombre || initialApellidos != apellidos || initialEspecialidadId != especialidadId) {
                  ref.read(doctoresRepositoryProvider).updateDoctor(doctor.id.toString(), nombre, apellidos, especialidadId);
                  Navigator.of(context).pop();
                }
                else {
                  Navigator.of(context).pop();
                }
              }
              
              //TODO: guardar resultado pyresponse
              }, child: const Text("Guardar")
            )
          ],
        ));
      },
    );
  }

  static Future<dynamic> updateEspecialidadDialog(BuildContext context, WidgetRef ref, Especialidad especialidad) {

    final textStyle = Theme.of(context).textTheme;
    final TextEditingController nombreEspController = TextEditingController(text: especialidad.nombreEspecialidad);

    final String initialNombre = especialidad.nombreEspecialidad;

    return showDialog(context: context, 
      builder: (context) {
        return(AlertDialog(
          title: const Text("Editar"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text("Ingrese el nombre actualizado de la especialidad.", style: textStyle.headlineSmall,),
                ),
                TextFormField(
                  controller: nombreEspController,
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
              final nombreEspecialidad = nombreEspController.text;
              if (nombreEspecialidad.length <= 4) {
                Navigator.of(context).pop();
              } 
              else {
                if (initialNombre != nombreEspecialidad) {
                  ref.read(especialidadesRepositoryprovider).updateEspecialidad(especialidad.id.toString(), nombreEspecialidad);
                  Navigator.of(context).pop();
                }
                else {
                  Navigator.of(context).pop();
                }
              }
              }, 
              child: const Text("Guardar")
            )
          ],
        ));
      },
    );
  }

  static Future<dynamic> updatePacienteDialog(BuildContext context, WidgetRef ref, Paciente paciente) {

    final textStyle = Theme.of(context).textTheme;
    final TextEditingController nombreController = TextEditingController(text: paciente.nombre);
    final TextEditingController apellidosController = TextEditingController(text: paciente.apellidos);
    final TextEditingController edadController = TextEditingController(text: paciente.edad.toString());
    final TextEditingController telefonoController = TextEditingController(text: paciente.telefono);
    final TextEditingController correoController = TextEditingController(text: paciente.correo);

    final String initialNombre = paciente.nombre;
    final String initialApellidos = paciente.apellidos;
    final String initialEdad = paciente.edad.toString();
    final String initialTelefono = paciente.telefono;
    final String initialCorreo = paciente.correo;

    return showDialog(context: context, 
      builder: (context) {
        return(AlertDialog(
          title: const Text("Editar"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Text("Ingrese los datos actualizados del paciente." , style: textStyle.headlineSmall,),
                ),
                TextFormField(
                  controller: nombreController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  keyboardType: TextInputType.name,
                  maxLength: 30,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-ZáéíóúÁÉÍÓÚñÑ ]"))  ],
                ),
                TextFormField(
                  controller: apellidosController,
                  decoration: const InputDecoration(labelText: 'Apellidos'),
                  keyboardType: TextInputType.name,
                  maxLength: 40,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-ZáéíóúÁÉÍÓÚñÑ ]"))  ],
                ),
                TextFormField(
                  controller: edadController,
                  decoration: const InputDecoration(labelText: 'Edad'),
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                TextFormField(
                  controller: telefonoController,
                  decoration: const InputDecoration(labelText: 'Teléfono'),
                  keyboardType: TextInputType.phone,
                  maxLength: 13,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                TextFormField(
                  controller: correoController,
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
              final nombre = nombreController.text;
              final apellidos = apellidosController.text;
              final edad = edadController.text;
              final telefono = telefonoController.text;
              final correo = correoController.text;
              if (nombre.length <= 2 || apellidos.length <= 2 || int.parse(edad) > 129 || telefono.length <= 9 || correo.length <= 10) {
                Navigator.of(context).pop();
              } 
              else {
                if (initialNombre != nombre || initialApellidos != apellidos || initialEdad != edad || initialTelefono != telefono || initialCorreo != correo) {
                  ref.read(pacientesRepositoryProvider).updatePaciente(paciente.id.toString(), nombre, apellidos, edad, telefono, correo);
                  Navigator.of(context).pop();
                }
                else {
                  Navigator.of(context).pop();
                }
              }
            }, child: const Text("Guardar"))
          ],
        ));
      },
    );
  }
  
  static Future<dynamic> updateCitaDialog(BuildContext context, WidgetRef ref, Cita cita, Doctor doctor, Paciente paciente) {

    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    final TextEditingController pacienteController = TextEditingController(text: "${paciente.nombre} ${paciente.apellidos}");
    final TextEditingController doctorController = TextEditingController(text: "${doctor.nombre} ${doctor.apellidos}");
    final TextEditingController especialidadController = TextEditingController(text: doctor.especialidad);
    //final TextEditingController telefonoController = TextEditingController(text: paciente.telefono);

    final String initialFecha = cita.fecha;
    final String initialHora = Formatos.formatearHora(cita.hora);
    String currentHora = initialHora;

    List<String> horas = [
      "07:00",
      "08:00",
      "09:00",
      "10:00",
      "11:00",
      "12:00",
      "13:00",
      "14:00",
      "15:00",
      "16:00",
      "17:00",
      "18:00",
      "19:00",
    ];

    return showDialog(context: context, 
      builder: (context) {
        return(AlertDialog(
          title: const Text("Editar"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Text("Ingrese los datos de fecha y hora actualizados de la cita." , style: textStyle.headlineSmall,),
                ),
                TextFormField(
                  readOnly: true,
                  controller: pacienteController,
                  decoration: const InputDecoration(labelText: 'Paciente'),
                  keyboardType: TextInputType.name,
                  maxLength: 70,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-ZáéíóúÁÉÍÓÚñÑ ]"))  ],
                ),
                TextFormField(
                  readOnly: true,
                  controller: doctorController,
                  decoration: const InputDecoration(labelText: 'Doctor'),
                  keyboardType: TextInputType.name,
                  maxLength: 70,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-ZáéíóúÁÉÍÓÚñÑ ]"))  ],
                ),
                TextFormField(
                  readOnly: true,
                  controller: especialidadController,
                  decoration: const InputDecoration(labelText: 'Especialidad'),
                  keyboardType: TextInputType.name,
                  maxLength: 30,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-ZáéíóúÁÉÍÓÚñÑ ]"))  ],
                ),
                // TextFormField(
                //   controller: telefonoController,
                //   decoration: const InputDecoration(labelText: 'Teléfono'),
                //   keyboardType: TextInputType.phone,
                //   maxLength: 13,
                //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                // ),

                Text("Hora", style: textStyle.bodyLarge,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: StatefulBuilder(builder: (context, setState) {
                    return DropdownButton<String>(
                      focusColor: Colors.transparent,
                      dropdownColor: colors.inversePrimary,
                      elevation: 4,
                      value: currentHora,
                      onChanged: (String? newValue) {
                        setState(() {
                          currentHora = newValue!;
                        });
                      },
                      items: horas
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
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
              //final telefono = telefonoController.text;
              if (initialHora != currentHora) {
                ref.read(citasRepositoryProvider).updateCita(cita.id.toString(), doctor.id.toString(), paciente.id.toString(), cita.especialidadId.toString(), cita.fecha, currentHora);
                Navigator.of(context).pop();
              }
              else {
                Navigator.of(context).pop();
              }
            }, child: const Text("Guardar"))
          ],
        ));
      },
    );
  }
}