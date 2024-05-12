import 'package:agenda/domain/entities/cita.dart';
import 'package:agenda/domain/entities/py_response.dart';

abstract class CitasRepository {

  Future<List<Cita>> getCitas();

  Future<PyResponse> deleteCita(int id);
}