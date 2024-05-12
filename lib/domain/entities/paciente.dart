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

  factory Paciente.fromJson(Map<String, dynamic> json) => Paciente(
        apellidos: json["apellido"],
        correo: json["correo"],
        edad: json["edad"],
        id: json["id"],
        nombre: json["nombre"],
        telefono: json["telefono"],
    );

    Map<String, dynamic> toJson() => {
        "apellido": apellidos,
        "correo": correo,
        "edad": edad,
        "id": id,
        "nombre": nombre,
        "telefono": telefono,
    };
}