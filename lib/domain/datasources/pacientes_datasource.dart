import 'package:agenda/domain/entities/paciente.dart';
import 'package:agenda/domain/entities/py_response.dart';

abstract class PacientesDatasource {

  Future<List<Paciente>> getPacientes();

  Future<PyResponse> deletePaciente(int id);

  Future<PyResponse> addPaciente(String nombre, String apellidos, String edad, String telefono, String correo);
  
  Future<PyResponse> updatePaciente(String nombre, String apellidos, String edad, String telefono, String correo);
}