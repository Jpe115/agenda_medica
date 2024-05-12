import 'package:agenda/domain/datasources/pacientes_datasource.dart';
import 'package:agenda/domain/entities/paciente.dart';
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

}