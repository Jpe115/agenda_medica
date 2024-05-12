import 'package:agenda/domain/entities/doctor.dart';
import 'package:agenda/presentation/providers/doctores/doctores_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final doctoresProvider = StateNotifierProvider<DoctoresNotifier, List<Doctor>>((ref) {
  final fetchDoctores = ref.watch(doctoresRepositoryProvider).getDoctores;

  return DoctoresNotifier(fetchDoctores: fetchDoctores);
});

typedef DoctorCallback = Future<List<Doctor>> Function();

class DoctoresNotifier extends StateNotifier<List<Doctor>> {

  DoctorCallback fetchDoctores;
  bool isLoading = false;
  
  DoctoresNotifier({
    required this.fetchDoctores
  }):super([]);

  Future<void> loadAllDoctores() async{

    if (isLoading) return;

    isLoading = true;
    final doctores = await fetchDoctores();
    state = doctores;

    isLoading = false;
  }
}