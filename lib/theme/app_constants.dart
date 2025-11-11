import 'package:flutter/animation.dart';

/// Constantes de espaciado y dimensiones de Zaia App
class AppSpacing {
  // Espaciados base
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // Espaciados específicos de componentes
  static const double cardPadding = 16.0;
  static const double screenPadding = 20.0;
  static const double buttonPadding = 12.0;
  static const double iconPadding = 8.0;

  // Dimensiones de iconos
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;

  // Dimensiones de avatares
  static const double avatarSizeSmall = 32.0;
  static const double avatarSizeMedium = 48.0;
  static const double avatarSizeLarge = 80.0;
  static const double avatarSizeXLarge = 120.0;
}

/// Constantes de bordes redondeados
class AppBorderRadius {
  // Border radius base
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 28.0;

  // Border radius para componentes específicos
  static const double card = 16.0;
  static const double button = 12.0;
  static const double input = 12.0;
  static const double chip = 8.0;
  static const double dialog = 20.0;

  // Border radius circular completo
  static const double circle = 9999.0;
}

/// Constantes de elevación y sombras
class AppElevation {
  static const double none = 0.0;
  static const double low = 2.0;
  static const double medium = 4.0;
  static const double high = 8.0;
  static const double highest = 16.0;
}

/// Constantes de animación
class AppAnimation {
  // Duraciones
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);

  // Curvas
  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve enterCurve = Curves.easeOut;
  static const Curve exitCurve = Curves.easeIn;
}

/// Constantes de dimensiones de breakpoints (responsive)
class AppBreakpoints {
  static const double mobile = 480;
  static const double tablet = 768;
  static const double desktop = 1024;
  static const double wide = 1440;
}
