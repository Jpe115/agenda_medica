
import 'package:agenda/domain/entities/doctor.dart';
import 'package:agenda/domain/entities/py_response.dart';

abstract class DoctoresDatasource {

  Future<List<Doctor>> getDoctores();

  Future<PyResponse> deleteDoctor(int id);
}