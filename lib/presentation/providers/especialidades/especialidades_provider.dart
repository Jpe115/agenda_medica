import 'dart:async';

import 'package:agenda/domain/entities/especialidad.dart';
import 'package:agenda/presentation/providers/especialidades/especialidades_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final especialidadesProvider = StateNotifierProvider<EspecialidadesNotifier, List<Especialidad>>((ref) {
  final fetchEspecialidades = ref.watch(especialidadesRepositoryprovider).getEspecialidades;

  return EspecialidadesNotifier(fetchEspecialidades: fetchEspecialidades);
});

typedef EspecialidadCallback = Future<List<Especialidad>> Function();

class EspecialidadesNotifier extends StateNotifier<List<Especialidad>> {

  bool isLoading = false;
  EspecialidadCallback fetchEspecialidades;

  EspecialidadesNotifier({
    required this.fetchEspecialidades
  }):super([]);

  Future<void> loadAllEspecialidades() async{

    if (isLoading) return;

    isLoading = true;
    final especialidades = await fetchEspecialidades();
    state = especialidades;

    isLoading = false; 
  }
}