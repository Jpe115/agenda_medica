import 'package:agenda/domain/entities/cita.dart';

abstract class CitasDatasource {

  Future<List<Cita>> getCitas(String year, String month);

}