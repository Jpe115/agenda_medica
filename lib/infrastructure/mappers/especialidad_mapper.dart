import 'package:agenda/domain/entities/especialidad.dart';
import 'package:agenda/infrastructure/models/pydb/especialidad_response.dart';

class EspecialidadMapper {

  static Especialidad especialidadToEntity(EspecialidadResponse especialidadResponse) => Especialidad(
    id: especialidadResponse.id, 
    nombreEspecialidad: especialidadResponse.especialidad
  );
}