import 'package:agenda/infrastructure/datasources/doctor_pydb_datasource.dart';
import 'package:agenda/infrastructure/repositories/doctores_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final doctoresRepositoryProvider = Provider((ref) {
  return DoctoresRepositoryImpl(datasource: DcotorPydbDatasource());
});