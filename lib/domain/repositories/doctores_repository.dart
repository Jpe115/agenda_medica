import 'package:agenda/domain/entities/doctor.dart';
import 'package:agenda/domain/entities/py_response.dart';

abstract class DoctoresRepository {

  Future<List<Doctor>> getDoctores();

  Future<PyResponse> deleteDoctor(int id);

  Future<PyResponse> addDoctor(String nombre, String apellidos, String especialidadId);
  
  Future<PyResponse> updateDoctor(String doctorId, String nombre, String apellidos, String especialidadId);
}