import 'package:agenda/domain/entities/cita.dart';

abstract class CitasRepository {

  Future<List<Cita>> getCitas();
}