import 'package:agenda/domain/entities/especialidad.dart';

abstract class EspecialidadesDatasource {

  Future<List<Especialidad>> getEspecialidades();

}