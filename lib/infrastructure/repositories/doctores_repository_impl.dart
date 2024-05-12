import 'package:agenda/domain/entities/doctor.dart';
import 'package:agenda/domain/repositories/doctores_repository.dart';
import 'package:agenda/infrastructure/datasources/doctor_pydb_datasource.dart';

class DoctoresRepositoryImpl extends DoctoresRepository {

  final DcotorPydbDatasource datasource;
  DoctoresRepositoryImpl({required this.datasource});

  @override
  Future<List<Doctor>> getDoctores() {
    return datasource.getDoctores();
  }

}