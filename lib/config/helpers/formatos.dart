class Formatos {
  static String formatearHora(String hora) {
    if (hora.length == 4) {
      return '${hora.substring(0, 2)}:${hora.substring(2)}';
    }
    return '0${hora.substring(0, 1)}:${hora.substring(1)}';
  }
}