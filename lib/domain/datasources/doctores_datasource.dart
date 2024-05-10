
import 'package:agenda/domain/entities/doctor.dart';

abstract class DoctoresDatasource {

  Future<List<Doctor>> getDoctores();

}