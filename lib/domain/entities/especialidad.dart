class Especialidad {

  final int id;
  final String nombreEspecialidad;

  Especialidad({
    required this.id, 
    required this.nombreEspecialidad
  });

  factory Especialidad.fromJson(Map<String, dynamic> json) {
    return Especialidad(
      nombreEspecialidad: json['especialidad'],
      id: json['id'],
    );
  }
}