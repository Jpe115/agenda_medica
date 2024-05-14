import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:agenda/domain/entities/especialidad.dart';
import 'package:agenda/presentation/providers/especialidades/especialidades_provider.dart';
import 'package:agenda/presentation/widgets/widgets.dart';

class EspecialidadesScreen extends ConsumerStatefulWidget {

  static const name = "especialidades_screen";

  const EspecialidadesScreen({super.key});

  @override
  EspecialidadesScreenState createState() => EspecialidadesScreenState();
}

class EspecialidadesScreenState extends ConsumerState<EspecialidadesScreen> {

  void refrescar() async{
    await Future.delayed(const Duration(milliseconds: 350));
    ref.watch(especialidadesProvider.notifier).loadAllEspecialidades();
  }

  @override
  void initState() {
    super.initState();

    ref.read(especialidadesProvider.notifier).loadAllEspecialidades();
  }

  @override
  Widget build(BuildContext context) {

    final especialidades = ref.watch(especialidadesProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(EspecialidadesScreen.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _AddContainer(ref: ref, refrescar: refrescar,),

            const SizedBox(height: 13,),

            SizedBox(
              height: 531,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: ListView.builder(
                  itemCount: especialidades.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                    return const _TableHeaders();
                    }
                    return _TableRows(especialidad: especialidades[index - 1], ref: ref, refrescar: refrescar,);
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

class _TableHeaders extends StatelessWidget {
  const _TableHeaders();

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
              child: Text("ID", style: textStyle.titleLarge),
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

class _TableRows extends StatefulWidget {

  final Especialidad especialidad;
  final WidgetRef ref;
  final VoidCallback refrescar;


  const _TableRows({required this.especialidad, required this.ref, required this.refrescar});

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
        TableRow(
          children: [
            TableCell(verticalAlignment: TableCellVerticalAlignment.middle, 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(widget.especialidad.id.toString(), style: textStyle.bodyLarge,),
              ),
            ),
            TableCell(verticalAlignment: TableCellVerticalAlignment.middle, 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(widget.especialidad.nombreEspecialidad, style: textStyle.bodyLarge,),
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
                    await DeleteDialogs.deleteEspecialidadDialog(context, widget.ref, widget.especialidad.id);
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

class _AddContainer extends StatelessWidget {

  final WidgetRef ref;
  final VoidCallback refrescar;
  const _AddContainer({required this.ref, required this.refrescar});

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
              child: Text("Listado de especialidades", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 13),
              child: FilledButton.icon(
                onPressed: () async{
                  await AddDialogs.newEspecialidadDialog(context, ref);
                  refrescar();
                }, 
                icon: const Icon(Icons.add_circle_outline_rounded),
                label: const Text("Añadir nueva especialidad")
              ),
            )
          ],
        ),
      ),
    );
  }
}