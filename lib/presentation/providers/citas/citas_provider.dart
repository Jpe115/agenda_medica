import 'package:agenda/domain/entities/cita.dart';
import 'package:agenda/presentation/providers/citas/citas_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final doctoresProvider = StateNotifierProvider<CitasNotifier, List<Cita>>((ref) {
  final fetchCitas = ref.read(citasRepositoryProvider).getCitas;

  return CitasNotifier(fetchCitas: fetchCitas);
});

typedef CitaCallback = Future<List<Cita>> Function(String year, String month);

class CitasNotifier extends StateNotifier<List<Cita>> {

  CitaCallback fetchCitas;
  bool isLoading = false;
  
  CitasNotifier({
    required this.fetchCitas
  }):super([]);

  Future<void> loadAllCitas(String year, String month) async{

    if (isLoading) return;

    isLoading = true;
    final citas = await fetchCitas(year, month);
    state = citas;

    isLoading = false;
  }
}