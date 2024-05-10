import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FilledButton(onPressed: (){
              newDoctorDialog(context);
              }, child: const Text("Añadir doctor")
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> newDoctorDialog(BuildContext context) {
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
}
