import 'package:agenda/domain/datasources/especialidades_datasource.dart';
import 'package:agenda/domain/entities/especialidad.dart';
import 'package:agenda/domain/entities/py_response.dart';
import 'package:dio/dio.dart';

class EspecialidadPydbDatasource extends EspecialidadesDatasource {

  final dio = Dio(BaseOptions(
      baseUrl: "http://127.0.0.1:5000/api"
  ));

  @override
  Future<List<Especialidad>> getEspecialidades() async{

    final response = await dio.get("/especialidades");

    // Asegúrate de que response.data es una List
    if (response.data is List) {
      List<Especialidad> especialidades = (response.data as List).map((item) {
        return Especialidad.fromJson(item);
      }).toList();

      return especialidades;
    } else {
      throw Exception('Expected a list');
    }
  }

  @override
  Future<PyResponse> deleteEspecialidad(int id) async{
    
    final response = await dio.delete("/especialidades/delete/$id");

    return PyResponse.fromJson(response.data);
  }
  
  @override
  Future<PyResponse> addEspecialidad(String nombreEspecialidad) async{
    final response = await dio.post("/especialidades/add", data: {
      "especialidad": nombreEspecialidad
    }, options: Options(
    contentType: Headers.formUrlEncodedContentType,
    ));

    return PyResponse.fromJson(response.data);
  }
  
  @override
  Future<PyResponse> updateEspecialidad(String especialidadId, String nombreEspecialidad) async{
    final response = await dio.put("/especialidades/update", data: {
      "id": especialidadId,
      "especialidad": nombreEspecialidad
    }, options: Options(
    contentType: Headers.formUrlEncodedContentType,
    ));

    return PyResponse.fromJson(response.data);
  }


}