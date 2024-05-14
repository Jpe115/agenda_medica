import 'package:agenda/domain/entities/paciente.dart';
import 'package:agenda/domain/entities/py_response.dart';

abstract class PacientesRepository {

  Future<List<Paciente>> getPacientes();

  Future<PyResponse> deletepaciente(int id);

  Future<PyResponse> addPaciente(String nombre, String apellidos, String edad, String telefono, String correo);
  
  Future<PyResponse> updatePaciente(String pacienteId, String nombre, String apellidos, String edad, String telefono, String correo);
}