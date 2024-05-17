import 'package:dio/dio.dart';

import 'package:agenda/domain/datasources/citas_datasource.dart';
import 'package:agenda/domain/entities/cita.dart';
import 'package:agenda/domain/entities/py_response.dart';

class CitaPydbDatasource extends CitasDatasource {

  final dio = Dio(BaseOptions(
      baseUrl: "http://127.0.0.1:5000/api"
  ));

  @override
  Future<List<Cita>> getCitas(String year, String month) async{
    final response = await dio.get("/citas/$year/$month");

    // Asegúrate de que response.data es una List
    if (response.data is List) {
      List<Cita> citas = (response.data as List).map((item) {
        return Cita.fromJson(item);
      }).toList();

      return citas;
    } else {
      throw Exception('Expected a list');
    }
  }

  @override
  Future<PyResponse> deleteCita(int id) async{
    final response = await dio.delete("/citas/delete/$id");

    return PyResponse.fromJson(response.data);
  }

  @override
  Future<PyResponse> addCita(String doctorId, String pacienteId, String especialidadId, String fecha, String hora) async{
    final response = await dio.post("/citas/add", data: {
      "doctorId": doctorId,
      "pacienteId": pacienteId,
      "especialidadId": especialidadId,
      "fecha": fecha,
      "hora": hora
    }, options: Options(
    contentType: Headers.formUrlEncodedContentType,
    ));

    return PyResponse.fromJson(response.data);
  }

  @override
  Future<PyResponse> updateCita(String citaId, String doctorId, String pacienteId, String especialidadId, String fecha, String hora) async{
    final response = await dio.put("/citas/update", data: {
      "id": citaId,
      "fecha": fecha,
      "hora": hora
    }, options: Options(
    contentType: Headers.formUrlEncodedContentType,
    ));

    return PyResponse.fromJson(response.data);
  }

}