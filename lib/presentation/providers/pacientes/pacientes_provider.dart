import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:agenda/domain/entities/paciente.dart';
import 'package:agenda/presentation/providers/pacientes/pacientes_repository_provider.dart';

final pacientesProvider = StateNotifierProvider<PacientesNotifier, List<Paciente>>((ref) {
  final PacienteCallback fetchPacientes = ref.read(pacientesRepositoryProvider).getPacientes;

  return PacientesNotifier(fetchPacientes: fetchPacientes);
});

typedef PacienteCallback = Future<List<Paciente>> Function();

class PacientesNotifier extends StateNotifier<List<Paciente>>{

  PacienteCallback fetchPacientes;
  bool isLoading = false;

  PacientesNotifier({
    required this.fetchPacientes
  }):super([]);

  Future<void> loadAllPacientes() async{

    if (isLoading) return;

    isLoading = true;
    final pacientes = await fetchPacientes();
    state = pacientes;

    isLoading = false;
  }
}