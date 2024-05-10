class Paciente {

  final int id;
  final String nombre;
  final String apellidos;
  final int edad;
  final String telefono;
  final String correo;

  Paciente({
    required this.id, 
    required this.nombre, 
    required this.apellidos, 
    required this.edad, 
    required this.telefono, 
    required this.correo
  });
}