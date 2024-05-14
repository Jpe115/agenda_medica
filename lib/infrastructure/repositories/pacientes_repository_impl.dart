import 'package:agenda/domain/entities/paciente.dart';
import 'package:agenda/domain/entities/py_response.dart';
import 'package:agenda/domain/repositories/pacientes_repository.dart';
import 'package:agenda/infrastructure/datasources/pacientes_pydb_datasource.dart';

class PacientesRepositoryImpl extends PacientesRepository {

  final PacientePydbDatasource datasource;
  PacientesRepositoryImpl({required this.datasource});

  @override
  Future<List<Paciente>> getPacientes() {
    return datasource.getPacientes();
  }

  @override
  Future<PyResponse> deletepaciente(int id) {
    return datasource.deletePaciente(id);
  }
  
  @override
  Future<PyResponse> addPaciente(String nombre, String apellidos, String edad, String telefono, String correo) {
    return datasource.addPaciente(nombre, apellidos, edad, telefono, correo);
  }

}