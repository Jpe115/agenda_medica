import 'package:agenda/domain/datasources/doctores_datasource.dart';
import 'package:agenda/domain/entities/doctor.dart';
import 'package:agenda/domain/entities/py_response.dart';
import 'package:dio/dio.dart';

class DoctorPydbDatasource extends DoctoresDatasource {

  final dio = Dio(BaseOptions(
      baseUrl: "http://127.0.0.1:5000/api"
  ));

  @override
  Future<List<Doctor>> getDoctores() async{

    final response = await dio.get("/doctores");

    // Asegúrate de que response.data es una List
    if (response.data is List) {
      List<Doctor> doctores = (response.data as List).map((item) {
        return Doctor.fromJson(item);
      }).toList();

      return doctores;
    } else {
      throw Exception('Expected a list');
    }
  }

  @override
  Future<PyResponse> deleteDoctor(int id) async{
    final response = await dio.delete("/doctores/delete/$id");

    return PyResponse.fromJson(response.data);
  }
  
  @override
  Future<PyResponse> addDoctor(String nombre, String apellidos, String especialidadId) async{
    final response = await dio.post("/doctores/add", data: {
      "nombre": nombre,
      "apellido": apellidos,
      "especialidadId": especialidadId
    }, options: Options(
    contentType: Headers.formUrlEncodedContentType,
    ));

    return PyResponse.fromJson(response.data);
  }
  
  @override
  Future<PyResponse> updateDoctor(String doctorId, String nombre, String apellidos, String especialidadId) async{
    final response = await dio.put("/doctores/update", data: {
      "id": doctorId,
      "nombre": nombre,
      "apellido": apellidos,
      "especialidadId": especialidadId
    }, options: Options(
    contentType: Headers.formUrlEncodedContentType,
    ));

    return PyResponse.fromJson(response.data);
  }

}