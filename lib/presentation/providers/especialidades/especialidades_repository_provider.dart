import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:agenda/infrastructure/datasources/especialidad_pydb_datasource.dart';
import 'package:agenda/infrastructure/repositories/especialidades_repository_impl.dart';

final especialidadesRepositoryprovider = Provider((ref) {
  return EspecialidadesRepositoryimpl(datasource: EspecialidadPydbDatasource());
});