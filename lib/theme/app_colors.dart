import 'package:flutter/material.dart';

/// Colores de la aplicación Zaia extraídos desde Figma
class AppColors {
  // Colores primarios
  static const Color primary = Color(0xFF8B7355); // Tono tierra/bronce
  static const Color primaryLight = Color(0xFFA68A6D);
  static const Color primaryDark = Color(0xFF6D5A45);
  
  // Colores secundarios
  static const Color secondary = Color(0xFFB8956A); // Dorado suave
  static const Color secondaryLight = Color(0xFFD4B894);
  static const Color secondaryDark = Color(0xFF9A7A4F);
  
  // Colores de acento (para elementos destacados)
  static const Color accent = Color(0xFFD6B6A9); // Beige claro
  static const Color accentDark = Color(0xFFC4A88A);
  
  // Colores de fondo
  static const Color background = Color(0xFFFFFFFF); // Blanco cálido
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF5F2EF);
  
  // Colores de texto
  static const Color textPrimary = Color(0xFF2D2926); // Casi negro cálido
  static const Color textSecondary = Color(0xFF6B6562);
  static const Color textTertiary = Color(0xFF9E9A97);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  
  // Colores de estado
  static const Color success = Color(0xFF7FB069); // Verde natural
  static const Color warning = Color(0xFFE8B059);
  static const Color error = Color(0xFFD64933);
  static const Color info = Color(0xFF5B9BD5);
  
  // Colores neutrales
  static const Color grey50 = Color(0xFFFAF9F8);
  static const Color grey100 = Color(0xFFF5F3F1);
  static const Color grey200 = Color(0xFFF5F5F5);
  static const Color grey300 = Color(0xFFD1CCC7);
  static const Color grey400 = Color(0xFFB0A9A3);
  static const Color grey500 = Color(0xFF8A8279);
  static const Color grey600 = Color(0xFF6B6562);
  static const Color grey700 = Color(0xFF504D4A);
  static const Color grey800 = Color(0xFF3A3735);
  static const Color grey900 = Color(0xFF252321);
  
  // Colores para las piedras (basados en los brazaletes)
  static const Color amethyst = Color(0xFF9B7CB6); // Amatista
  static const Color sodalite = Color(0xFF4A5F8C); // Sodalita
  static const Color greenQuartz = Color(0xFF7FA67B); // Cuarzo verde
  static const Color blueQuartz = Color(0xFF6B8CAE); // Cuarzo azul
  static const Color citrine = Color(0xFFE8B84B); // Citrino
  static const Color tigerEye = Color(0xFFC8964B); // Ojo de tigre
  static const Color redJasper = Color(0xFFB8574D); // Jaspe rojo
  
  // Colores de cordón
  static const Color cordWhite = Color(0xFFFAF8F6);
  static const Color cordBlack = Color(0xFF2D2926);
  static const Color cordBrown = Color(0xFF8B7355);
  static const Color cordSilver = Color(0xFFB8B8B8);
  static const Color cordGold = Color(0xFFD4AF37);
  static const Color cordBronze = Color(0xFFB8956A);
  
  // Degradados
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [accent, accentDark],
  );
  
  // Sombras
  static const Color shadow = Color(0x1A000000);
  static const Color shadowMedium = Color(0x33000000);
  static const Color shadowStrong = Color(0x4D000000);
}
