import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home/home_screen.dart';
import '../screens/store/store_screen.dart';
import '../screens/faq/faq_screen.dart';
import '../screens/news/news_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/home/widgets/bottom_navigation.dart';

/// Configuración de rutas de la aplicación usando GoRouter
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          // Determinar el índice actual basado en la ruta
          final location = state.uri.path;
          int currentIndex = 0;

          if (location == '/') {
            currentIndex = 0;
          } else if (location.startsWith('/store')) {
            currentIndex = 1;
          } else if (location.startsWith('/faq')) {
            currentIndex = 2;
          } else if (location.startsWith('/news')) {
            currentIndex = 3;
          } else if (location.startsWith('/profile')) {
            currentIndex = 4;
          }

          return Scaffold(
            body: child,
            bottomNavigationBar: ZaiaBottomNavigation(currentIndex: currentIndex),
          );
        },
        routes: [
          GoRoute(path: '/', name: 'home', builder: (context, state) => const HomeScreen()),
          GoRoute(path: '/store', name: 'store', builder: (context, state) => const StoreScreen()),
          GoRoute(path: '/faq', name: 'faq', builder: (context, state) => const FaqScreen()),
          GoRoute(path: '/news', name: 'news', builder: (context, state) => const NewsScreen()),
          GoRoute(path: '/profile', name: 'profile', builder: (context, state) => const ProfileScreen()),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(body: Center(child: Text('Página no encontrada: ${state.uri}'))),
  );
}
