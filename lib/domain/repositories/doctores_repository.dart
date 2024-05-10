import 'package:agenda/domain/entities/doctor.dart';

abstract class DoctoresRepository {

  Future<List<Doctor>> getDoctores();
}