import 'package:agenda/domain/entities/cita.dart';
import 'package:agenda/domain/entities/py_response.dart';

abstract class CitasDatasource {

  Future<List<Cita>> getCitas(String year, String month);

  Future<PyResponse> deleteCita(int id);
}