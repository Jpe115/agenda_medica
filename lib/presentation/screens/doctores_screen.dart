import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:agenda/domain/entities/especialidad.dart';
import 'package:agenda/presentation/providers/especialidades/especialidades_provider.dart';

import 'package:agenda/domain/entities/doctor.dart';
import 'package:agenda/presentation/widgets/dialogs/update_dialogs.dart';
import 'package:agenda/presentation/providers/doctores/doctores_provider.dart';
import 'package:agenda/presentation/widgets/widgets.dart';

class DoctoresScreen extends ConsumerStatefulWidget {

  static const name = "Doctores";

  const DoctoresScreen({super.key});

  @override
  DoctoresScreenState createState() => DoctoresScreenState();
}

class DoctoresScreenState extends ConsumerState<DoctoresScreen> {

  void refrescar() async{
    await Future.delayed(const Duration(milliseconds: 475));
    ref.watch(doctoresProvider.notifier).loadAllDoctores();
  }

  @override
  void initState() {
    super.initState();

    ref.read(doctoresProvider.notifier).loadAllDoctores();
    ref.read(especialidadesProvider.notifier).loadAllEspecialidades();
  }

  @override
  Widget build(BuildContext context) {

    final doctores = ref.watch(doctoresProvider);
    final especialidades = ref.watch(especialidadesProvider);
    //final listaEspecialidades = especialidades.map(esp) =>

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(DoctoresScreen.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddContainer(listaEspecialidades: especialidades, ref: ref, refrescar: refrescar,),

            const SizedBox(height: 13,),

            SizedBox(
              height: 531,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: ListView.builder(
                  itemCount: doctores.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                    return const TableHeaders();
                    }
                    return TableRows(doctor: doctores[index - 1], ref: ref, refrescar: refrescar, especialidades: especialidades,);
                  },
                ),
              ),
            ),

            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Text("Mostrando registros del 1 al 10, del total de 10"),
                ),
                const Spacer(),
                TextButton(onPressed: () {}, child: const Text("Anterior")),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextButton(onPressed: () {}, child: const Text("Siguiente")),
                ),
              ],
            ),

            Container(color: Colors.amber, height: 70,)
          ],
        ),
      ),
    );
  }
}

class TableHeaders extends StatelessWidget {
  const TableHeaders({
    super.key,
  });

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
            TableCell(child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text("Nombre", style: textStyle.titleLarge),
            )),
            TableCell(child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text("Apellido", style: textStyle.titleLarge,),
            )),
            TableCell(child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text("Especialidad", style: textStyle.titleLarge,),
            )),
            TableCell(child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text("Acciones", style: textStyle.titleLarge,),
            )),
          ]
        )
      ],
    );
  }
}

class TableRows extends StatefulWidget {

  final Doctor doctor;
  final List<Especialidad> especialidades;
  final WidgetRef ref;
  final VoidCallback refrescar;

  const TableRows({
    super.key, 
    required this.doctor, 
    required this.ref, required this.refrescar, 
    required this.especialidades,
  });

  @override
  State<TableRows> createState() => _TableRowsState();
}

class _TableRowsState extends State<TableRows> {
  @override
  Widget build(BuildContext context) {

    final textStyle = Theme.of(context).textTheme;

    return Table(
      border: TableBorder.all(width: 0.85),
      children: [
        TableRow(
          children: [
            TableCell(verticalAlignment: TableCellVerticalAlignment.middle, 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(widget.doctor.nombre, style: textStyle.bodyLarge,),
              ),
            ),
            TableCell(verticalAlignment: TableCellVerticalAlignment.middle, 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(widget.doctor.apellidos, style: textStyle.bodyLarge,),
              )
            ),
            TableCell(verticalAlignment: TableCellVerticalAlignment.middle, 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(widget.doctor.especialidad, style: textStyle.bodyLarge,),
              )
            ),
            TableCell(
              child: Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: IconButton.filled(onPressed: () async{
                      await UpdateDialogs.updateDoctorDialog(context, widget.ref, widget.especialidades, widget.doctor);
                      widget.refrescar();
                    }, 
                    icon: const Icon(Icons.edit_rounded)),
                  ),

                  IconButton.filled(onPressed: () async{
                    await DeleteDialogs.deleteDoctorDialog(context, widget.ref, widget.doctor.id);
                    widget.refrescar();
                    setState(() {
                    });
                  }, icon: const Icon(Icons.delete_forever_rounded)),

                ],
              )
            ),
          ]
        )
      ],
    );
  }
}

class AddContainer extends StatelessWidget {

  final List<Especialidad> listaEspecialidades;
  final WidgetRef ref;
  final VoidCallback refrescar;

  const AddContainer({
    super.key, required this.listaEspecialidades, required this.ref, required this.refrescar,
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
                onPressed: () async{
                  //final PyResponse a = 
                  await AddDialogs.newDoctorDialog(context, ref, listaEspecialidades);
                  //print(a.success);
                  refrescar();
                }, 
                icon: const Icon(Icons.add_circle_outline_rounded),
                label: const Text("Añadir nuevo doctor")
              ),
            )
          ],
        ),
      ),
    );
  }
}