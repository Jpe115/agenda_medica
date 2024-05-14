import 'package:agenda/domain/entities/cita.dart';
import 'package:agenda/domain/entities/py_response.dart';
import 'package:agenda/domain/repositories/citas_repository.dart';
import 'package:agenda/infrastructure/datasources/cita_pydb_datasource.dart';

class CitasRepositoryImpl extends CitasRepository {

  final CitaPydbDatasource datasource;
  CitasRepositoryImpl({required this.datasource});

  @override
  Future<PyResponse> addCita(String doctorId, String pacienteId, String especialidadId, String fecha, String hora) {
    return datasource.addCita(doctorId, pacienteId, especialidadId, fecha, hora);
  }

  @override
  Future<PyResponse> deleteCita(int id) {
    return datasource.deleteCita(id);
  }

  @override
  Future<List<Cita>> getCitas(String year, String month) {
    return datasource.getCitas(year, month);
  }

  @override
  Future<PyResponse> updateCita(String citaId, String doctorId, String pacienteId, String especialidadId, String fecha, String hora) {
    return datasource.updateCita(citaId, doctorId, pacienteId, especialidadId, fecha, hora);
  }


}