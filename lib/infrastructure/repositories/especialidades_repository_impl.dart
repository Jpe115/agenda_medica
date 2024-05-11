import 'package:agenda/domain/entities/especialidad.dart';
import 'package:agenda/domain/repositories/especialidades_repository.dart';
import 'package:agenda/infrastructure/datasources/especialidad_pydb_datasource.dart';

class EspecialidadesRepositoryimpl extends EspecialidadesRepository {

  final EspecialidadPydbDatasource datasource;
  EspecialidadesRepositoryimpl({required this.datasource});

  @override
  Future<List<Especialidad>> getEspecialidades() {
    return datasource.getEspecialidades();
  }
}