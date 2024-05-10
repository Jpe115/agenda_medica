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
}