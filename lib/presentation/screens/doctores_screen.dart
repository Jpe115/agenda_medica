import 'package:agenda/domain/entities/doctor.dart';
import 'package:agenda/presentation/providers/doctores/doctores_provider.dart';
import 'package:agenda/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoctoresScreen extends ConsumerStatefulWidget {

  static const name = "doctores_screen";

  const DoctoresScreen({super.key});

  @override
  DoctoresScreenState createState() => DoctoresScreenState();
}

class DoctoresScreenState extends ConsumerState<DoctoresScreen> {

  @override
  void initState() {
    super.initState();

    ref.read(doctoresProvider.notifier).loadAllDoctores();
  }

  @override
  Widget build(BuildContext context) {

    final doctores = ref.watch(doctoresProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(DoctoresScreen.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AddContainer(),

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
                    return TableRows(doctor: doctores[index - 1], ref: ref,);
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

    return Table(
      border: TableBorder.all(width: 0.95),
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.deepPurple.shade100),
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
  final WidgetRef ref;

  const TableRows({
    super.key, 
    required this.doctor, 
    required this.ref,
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
                    child: IconButton.filled(onPressed: () {}, icon: const Icon(Icons.edit_rounded)),
                  ),

                  IconButton.filled(onPressed: () async{
                    final a = await DeleteDialogs.deleteDoctorDialog(context, widget.ref, widget.doctor.id);
                    await widget.ref.read(doctoresProvider.notifier).loadAllDoctores();
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