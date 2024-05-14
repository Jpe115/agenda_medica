import 'package:agenda/domain/datasources/pacientes_datasource.dart';
import 'package:agenda/domain/entities/paciente.dart';
import 'package:agenda/domain/entities/py_response.dart';
import 'package:dio/dio.dart';

class PacientePydbDatasource extends PacientesDatasource {

  final dio = Dio(BaseOptions(
      baseUrl: "http://127.0.0.1:5000/api"
  ));

  @override
  Future<List<Paciente>> getPacientes() async{
    final response = await dio.get("/pacientes");

    if (response.data is List) {
      List<Paciente> pacientes = (response.data as List).map((item) {
        return Paciente.fromJson(item);
      }).toList();

      return pacientes;
    } else {
      throw Exception('Expected a list');
    }
  }

  @override
  Future<PyResponse> deletePaciente(int id) async{
    final response = await dio.delete("/pacientes/delete/$id");

    return PyResponse.fromJson(response.data);
  }
  
  @override
  Future<PyResponse> addPaciente(String nombre, String apellidos, String edad, String telefono, String correo) async{
    final response = await dio.post("/pacientes/add", data: {
      "nombre": nombre,
      "apellido": apellidos,
      "edad": edad,
      "telefono": telefono,
      "correo": correo,
    }, options: Options(
    contentType: Headers.formUrlEncodedContentType,
    ));

    return PyResponse.fromJson(response.data);
  }

}