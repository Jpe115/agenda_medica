import 'package:go_router/go_router.dart';
import 'package:agenda/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [

    GoRoute(
      path: "/",
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),  
    ),

    GoRoute(
      path: "/doctores",
      name: DoctoresScreen.name,
      builder: (context, state) => const DoctoresScreen(),  
    ),

    GoRoute(
      path: "/pacientes",
      name: PacientesScreen.name,
      builder: (context, state) => const PacientesScreen(),  
    ),

    GoRoute(
      path: "/especialidades",
      name: EspecialidadesScreen.name,
      builder: (context, state) => const EspecialidadesScreen(),  
    ),

    GoRoute(
      path: "/citas",
      name: CitasScreen.name,
      builder: (context, state) => const CitasScreen(),  
    ),

  ]
);