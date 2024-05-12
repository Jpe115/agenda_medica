class Doctor {
  final int id;
  final String nombre;
  final String apellidos;
  final int especialidadId;
  final String especialidad;

  Doctor({
    required this.id, 
    required this.nombre, 
    required this.apellidos, 
    required this.especialidadId,
    required this.especialidad
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        apellidos: json["apellido"],
        especialidad: json["especialidad"],
        especialidadId: json["especialidadId"],
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "apellido": apellidos,
        "especialidad": especialidad,
        "especialidadId": especialidadId,
        "id": id,
        "nombre": nombre,
    };
}