import 'package:agenda/domain/entities/doctor.dart';
import 'package:agenda/domain/entities/py_response.dart';
import 'package:agenda/domain/repositories/doctores_repository.dart';
import 'package:agenda/infrastructure/datasources/doctor_pydb_datasource.dart';

class DoctoresRepositoryImpl extends DoctoresRepository {

  final DoctorPydbDatasource datasource;
  DoctoresRepositoryImpl({required this.datasource});

  @override
  Future<List<Doctor>> getDoctores() {
    return datasource.getDoctores();
  }

  @override
  Future<PyResponse> deleteDoctor(int id) {
    return datasource.deleteDoctor(id);
  }
  
  @override
  Future<PyResponse> addDoctor(String nombre, String apellidos, String especialidadId) {
    return datasource.addDoctor(nombre, apellidos, especialidadId);
  }
  
  @override
  Future<PyResponse> updateDoctor(String doctorId, String nombre, String apellidos, String especialidadId) {
    return datasource.updateDoctor(doctorId, nombre, apellidos, especialidadId);
  }

}