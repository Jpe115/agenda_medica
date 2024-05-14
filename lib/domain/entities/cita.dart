class Cita {

  final int id;
  final int pacienteId;
  final int doctorId;
  final int especialidadId;
  final String fecha;
  final String hora;

  Cita({
    required this.id, 
    required this.pacienteId, 
    required this.doctorId, 
    required this.especialidadId, 
    required this.fecha, 
    required this.hora
  });

  factory Cita.fromJson(Map<String, dynamic> json) => Cita(
        doctorId: json["doctorId"],
        especialidadId: json["especialidadId"],
        fecha: json["fecha"],
        hora: json["hora"],
        id: json["id"],
        pacienteId: json["pacienteId"],
    );

    Map<String, dynamic> toJson() => {
        "doctorId": doctorId,
        "especialidadId": especialidadId,
        "fecha": fecha,
        "hora": hora,
        "id": id,
        "pacienteId": pacienteId,
    };
}