import 'package:agenda/infrastructure/datasources/pacientes_pydb_datasource.dart';
import 'package:agenda/infrastructure/repositories/pacientes_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pacientesRepositoryProvider = Provider((ref) {
  return PacientesRepositoryImpl(datasource: PacientePydbDatasource());
});