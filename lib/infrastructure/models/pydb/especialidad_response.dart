
class EspecialidadResponse {
    final String especialidad;
    final int id;

    EspecialidadResponse({
        required this.especialidad,
        required this.id,
    });

    factory EspecialidadResponse.fromJson(Map<String, dynamic> json) => EspecialidadResponse(
        especialidad: json["especialidad"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "especialidad": especialidad,
        "id": id,
    };
}
