import 'package:agenda/domain/datasources/especialidades_datasource.dart';
import 'package:agenda/domain/entities/especialidad.dart';
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


}