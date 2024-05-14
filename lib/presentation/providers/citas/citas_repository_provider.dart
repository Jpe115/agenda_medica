import 'package:agenda/infrastructure/datasources/cita_pydb_datasource.dart';
import 'package:agenda/infrastructure/repositories/citas_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final citasRepositoryProvider = Provider((ref) {
  return CitasRepositoryImpl(datasource: CitaPydbDatasource());
});