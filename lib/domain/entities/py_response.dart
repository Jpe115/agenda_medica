class PyResponse {
    final String message;
    final bool success;

    PyResponse({
        required this.message,
        required this.success,
    });

    factory PyResponse.fromJson(Map<String, dynamic> json) => PyResponse(
        message: json["message"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
    };
}
