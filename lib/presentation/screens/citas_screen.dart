import 'package:agenda/config/helpers/formatos.dart';
import 'package:agenda/domain/entities/cita.dart';
import 'package:agenda/domain/entities/paciente.dart';
import 'package:agenda/presentation/providers/theme_provider.dart';
import 'package:agenda/presentation/widgets/dialogs/update_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:agenda/domain/entities/doctor.dart';
import 'package:agenda/domain/entities/especialidad.dart';
import 'package:agenda/presentation/providers/citas/citas_provider.dart';
import 'package:agenda/presentation/providers/doctores/doctores_provider.dart';
import 'package:agenda/presentation/providers/especialidades/especialidades_provider.dart';
import 'package:agenda/presentation/providers/pacientes/pacientes_provider.dart';
import 'package:agenda/presentation/widgets/dialogs/add_dialogs.dart';
import 'package:agenda/presentation/widgets/dialogs/delete_dialogs.dart';
import 'package:table_calendar/table_calendar.dart';
//import 'package:agenda/presentation/widgets/dialogs/update_dialogs.dart';

class CitasScreen extends ConsumerStatefulWidget {
  static const name = "Citas";

  const CitasScreen({super.key});

  @override
  CitasScreenState createState() => CitasScreenState();
}

class CitasScreenState extends ConsumerState<CitasScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  void refrescar() async {
    await Future.delayed(const Duration(milliseconds: 475));
    ref.watch(citasProvider.notifier).loadAllCitas("2024", "5");
  }

  @override
  void initState() {
    super.initState();

    ref.read(citasProvider.notifier).loadAllCitas("2024", "5");
    ref.read(especialidadesProvider.notifier).loadAllEspecialidades();
    ref.read(doctoresProvider.notifier).loadAllDoctores();
    ref.read(pacientesProvider.notifier).loadAllPacientes();
  }

  @override
  Widget build(BuildContext context) {
    final doctores = ref.watch(doctoresProvider);
    final especialidades = ref.watch(especialidadesProvider);
    final pacientes = ref.watch(pacientesProvider);
    final citas = ref.watch(citasProvider);

    final citasColor = ref.watch(colorListProvider)[6];
    final citasTheme = ThemeData(colorSchemeSeed: citasColor);

    return Theme(
      data: citasTheme,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: citasTheme.colorScheme.inversePrimary,
          title: const Text(CitasScreen.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _EspecialidadesContainer(
                listaEspecialidades: especialidades,
                ref: ref,
                refrescar: refrescar,
              ),
              const SizedBox(
                height: 3,
              ),

              //Calendario
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: TableCalendar(
                  daysOfWeekHeight: 24,
                  daysOfWeekStyle: DaysOfWeekStyle(
                    decoration: BoxDecoration(
                      color: citasTheme.colorScheme.inversePrimary,
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                      defaultTextStyle: const TextStyle(fontSize: 15),
                      weekendTextStyle: const TextStyle(color: Colors.red),
                      outsideDaysVisible: false,
                      cellMargin: const EdgeInsets.all(5),
                      rowDecoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      )),
                  headerStyle: const HeaderStyle(
                      formatButtonVisible: false, 
                      titleCentered: true,
                      titleTextStyle: TextStyle(fontSize: 19.0),
                    ),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      // Call `setState()` when updating the selected day
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      // Call `setState()` when updating calendar format
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    // No need to call `setState()` here
                    _focusedDay = focusedDay;
                  },
                ),
              ),

              //Tabla
              const SizedBox(
                height: 31,
              ),
              SizedBox(
                height: 531,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: ListView.builder(
                    itemCount: citas.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return const _TableHeaders();
                      }
                      final Doctor doctor = doctores.firstWhere(
                        (doc) => doc.id == citas[index - 1].doctorId,
                      );
                      final Paciente paciente = pacientes.firstWhere(
                        (pac) => pac.id == citas[index - 1].pacienteId,
                      );
                      final Especialidad especialidad =
                          especialidades.firstWhere(
                        (esp) => esp.id == citas[index - 1].especialidadId,
                      );
                      return _TableRows(
                          doctor: doctor,
                          ref: ref,
                          refrescar: refrescar,
                          cita: citas[index - 1],
                          paciente: paciente,
                          especialidad: especialidad);
                    },
                  ),
                ),
              ),

              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                        "Mostrando registros del 1 al 10, del total de 10"),
                  ),
                  const Spacer(),
                  TextButton(onPressed: () {}, child: const Text("Anterior")),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextButton(
                        onPressed: () {}, child: const Text("Siguiente")),
                  ),
                ],
              ),

              Container(
                color: citasTheme.colorScheme.inversePrimary,
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TableHeaders extends StatelessWidget {
  const _TableHeaders();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Table(
      border: TableBorder.all(width: 0.95),
      children: [
        TableRow(
            decoration: BoxDecoration(color: colors.inversePrimary),
            children: [
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text("Paciente", style: textStyle.titleLarge),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Doctor",
                  style: textStyle.titleLarge,
                ),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Especialidad",
                  style: textStyle.titleLarge,
                ),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Fecha",
                  style: textStyle.titleLarge,
                ),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Hora",
                  style: textStyle.titleLarge,
                ),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Acciones",
                  style: textStyle.titleLarge,
                ),
              )),
            ])
      ],
    );
  }
}

class _TableRows extends StatefulWidget {
  final Doctor doctor;
  final Especialidad especialidad;
  final Paciente paciente;
  final Cita cita;
  final WidgetRef ref;
  final VoidCallback refrescar;

  const _TableRows({
    required this.doctor,
    required this.especialidad,
    required this.paciente,
    required this.ref,
    required this.cita,
    required this.refrescar,
  });

  @override
  State<_TableRows> createState() => _TableRowsState();
}

class _TableRowsState extends State<_TableRows> {

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Table(
      border: TableBorder.all(width: 0.85),
      children: [
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Text(
                "${widget.paciente.nombre} ${widget.paciente.apellidos}",
                style: textStyle.bodyLarge,
              ),
            ),
          ),
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  "${widget.doctor.nombre} ${widget.doctor.apellidos}",
                  style: textStyle.bodyLarge,
                ),
              )),
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  widget.especialidad.nombreEspecialidad,
                  style: textStyle.bodyLarge,
                ),
              )),
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  widget.cita.fecha.substring(0, 16),
                  style: textStyle.bodyLarge,
                ),
              )),
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  Formatos.formatearHora(widget.cita.hora),
                  style: textStyle.bodyLarge,
                ),
              )),
          TableCell(
              child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: IconButton.filled(
                    onPressed: () async {
                      await UpdateDialogs.updateCitaDialog(context, widget.ref, widget.cita, widget.doctor, widget.paciente);
                      widget.refrescar();
                    },
                    icon: const Icon(Icons.edit_rounded)),
              ),
              IconButton.filled(
                  onPressed: () async {
                    await DeleteDialogs.deleteCitaDialog(
                        context, widget.ref, widget.cita.id);
                    widget.refrescar();
                    setState(() {});
                  },
                  icon: const Icon(Icons.delete_forever_rounded)),
            ],
          )),
        ])
      ],
    );
  }
}

class _EspecialidadesContainer extends StatelessWidget {
  final List<Especialidad> listaEspecialidades;
  final WidgetRef ref;
  final VoidCallback refrescar;

  const _EspecialidadesContainer({
    required this.listaEspecialidades,
    required this.ref,
    required this.refrescar,
  });

  @override
  Widget build(BuildContext context) {
    String currentValue = listaEspecialidades.first.nombreEspecialidad;
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.grey.shade300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              child: Text(
                "Calendario para la especialidad:",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: StatefulBuilder(
                builder: (context, setState) {
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
                    items: listaEspecialidades
                        .map<DropdownMenuItem<String>>((Especialidad value) {
                      return DropdownMenuItem<String>(
                        value: value.nombreEspecialidad,
                        child: Text(value.nombreEspecialidad),
                      );
                    }).toList(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
