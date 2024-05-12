import 'package:agenda/domain/entities/paciente.dart';
import 'package:agenda/domain/entities/py_response.dart';

abstract class PacientesDatasource {

  Future<List<Paciente>> getPacientes();

  Future<PyResponse> deletePaciente(int id);
}