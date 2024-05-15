import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agenda/config/theme/app_theme.dart';

//Listado inmutable de colores
final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);

//Controller o notifier
class ThemeNotifier extends StateNotifier<AppTheme>{

  //state = AppTheme()
  ThemeNotifier(): super(AppTheme());

  void changeColorIndex(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);
  }
}