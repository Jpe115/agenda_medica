import 'package:agenda/domain/entities/paciente.dart';

abstract class PacientesDatasource {

  Future<List<Paciente>> getPacientes();

}