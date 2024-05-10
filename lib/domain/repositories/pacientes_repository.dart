import 'package:agenda/domain/entities/paciente.dart';

abstract class PacientesRepository {

  Future<List<Paciente>> getPacientes();
}