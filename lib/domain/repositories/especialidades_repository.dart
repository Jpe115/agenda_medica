import 'package:agenda/domain/entities/especialidad.dart';
import 'package:agenda/domain/entities/py_response.dart';

abstract class EspecialidadesRepository {

  Future<List<Especialidad>> getEspecialidades();

  Future<PyResponse> deleteEspecialidad(int id);

  Future<PyResponse> addEspecialidad(String nombreEspecialidad);
  
  Future<PyResponse> updateEspecialidad(String nombreEspecialidad);
}