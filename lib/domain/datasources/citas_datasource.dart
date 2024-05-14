import 'package:agenda/domain/entities/cita.dart';
import 'package:agenda/domain/entities/py_response.dart';

abstract class CitasDatasource {

  Future<List<Cita>> getCitas(String year, String month);

  Future<PyResponse> deleteCita(int id);

  Future<PyResponse> addCita(String doctorId, String pacienteId, String especialidadId, String fecha, String hora);
  
  Future<PyResponse> updateCita(String citaId, String doctorId, String pacienteId, String especialidadId, String fecha, String hora);
}