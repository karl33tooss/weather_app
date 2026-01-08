import 'package:go_router/go_router.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/forecast_report_screen.dart'; 
import '../data/models/forecast_model.dart';        

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    // 👇 НОВИЙ МАРШРУТ
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final forecast = state.extra as ForecastModel; 
        return ForecastReportScreen(forecast: forecast);
      },
    ),
  ],
);