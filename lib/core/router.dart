import 'package:go_router/go_router.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/search_screen.dart';

// Це наша глобальна змінна роутера
final router = GoRouter(
  // initialLocation - це те, з чого додаток стартує
  initialLocation: '/', 
  
  routes: [
    // Маршрут 1: Головна сторінка
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    
    // Маршрут 2: Пошук
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
  ],
);