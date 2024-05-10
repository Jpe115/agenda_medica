import 'package:agenda/domain/entities/especialidad.dart';

abstract class EspecialidadesRepository {

  Future<List<Especialidad>> getEspecialidades();
}