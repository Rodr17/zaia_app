# 🛠️ ZAIA - Guía Técnica para Desarrolladores

Esta guía contiene información técnica detallada para desarrolladores que trabajarán en el proyecto ZAIA.

## 📋 Tabla de Contenidos

- [Arquitectura](#arquitectura)
- [Stack Tecnológico](#stack-tecnológico)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Sistema de Diseño](#sistema-de-diseño)
- [Gestión de Estado](#gestión-de-estado)
- [Navegación](#navegación)
- [Animaciones](#animaciones)
- [Integración con Figma](#integración-con-figma)
- [Testing](#testing)
- [CI/CD](#cicd)
- [Mejores Prácticas](#mejores-prácticas)
- [Troubleshooting](#troubleshooting)

## 🏗️ Arquitectura

### Patrón de Arquitectura

El proyecto sigue una **arquitectura basada en features** con separación clara de responsabilidades:

```
┌─────────────────────────────────────┐
│         Presentation Layer          │
│    (Screens, Widgets, State)        │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│         Business Logic Layer        │
│      (Services, Repositories)       │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│            Data Layer               │
│    (Models, Data Sources, API)      │
└─────────────────────────────────────┘
```

### Principios Aplicados

- **SOLID**: Código mantenible y escalable
- **DRY**: No repetir código
- **KISS**: Mantener la simplicidad
- **Clean Code**: Código legible y autodocumentado

## 🔧 Stack Tecnológico

### Core

- **Flutter**: 3.9.2+
- **Dart**: 3.9.2+
- **Material Design 3**: UI Framework

### Dependencias Principales

```yaml
# Navegación
go_router: ^14.6.2              # Routing declarativo

# UI/UX
flutter_svg: ^2.2.2             # Soporte SVG
iconify_design: ^1.0.1          # Iconos personalizados
cupertino_icons: ^1.0.8         # Iconos iOS

# Dev Tools
flutter_lints: ^5.0.0           # Linting
flutter_launcher_icons: ^0.13.1 # Iconos de app
```

### Herramientas de Desarrollo

- **VS Code** con extensiones:
  - Flutter
  - Dart
  - Figma for VS Code
  - GitLens
  - Error Lens

## 📁 Estructura del Proyecto

```
zaia_app/
│
├── lib/
│   ├── main.dart                      # Entry point
│   │
│   ├── screens/                       # Pantallas de la app
│   │   ├── home/
│   │   │   └── home_screen.dart
│   │   ├── card/
│   │   │   └── card_detail_screen.dart
│   │   └── profile/
│   │       └── profile_screen.dart
│   │
│   ├── widgets/                       # Widgets reutilizables
│   │   ├── common/                    # Widgets comunes
│   │   └── specific/                  # Widgets específicos
│   │
│   ├── theme/                         # Sistema de diseño
│   │   ├── app_colors.dart           # Paleta de colores
│   │   ├── app_typography.dart       # Estilos de texto
│   │   ├── app_theme.dart            # Tema general
│   │   └── app_constants.dart        # Constantes (spacing, etc)
│   │
│   ├── models/                        # Modelos de datos
│   │   ├── challenge.dart
│   │   ├── user.dart
│   │   └── category.dart
│   │
│   ├── services/                      # Lógica de negocio
│   │   ├── api_service.dart
│   │   ├── auth_service.dart
│   │   └── storage_service.dart
│   │
│   ├── repositories/                  # Capa de datos
│   │   ├── challenge_repository.dart
│   │   └── user_repository.dart
│   │
│   ├── utils/                         # Utilidades
│   │   ├── helpers.dart
│   │   ├── validators.dart
│   │   └── extensions.dart
│   │
│   └── config/                        # Configuración
│       ├── routes.dart
│       └── constants.dart
│
├── assets/
│   ├── images/                        # Imágenes y logos
│   │   ├── logo.svg
│   │   └── ...
│   └── fonts/                         # Fuentes personalizadas
│       ├── Inter-VariableFont_opsz,wght.ttf
│       └── Inter-Italic-VariableFont_opsz,wght.ttf
│
├── test/                              # Tests
│   ├── unit/
│   ├── widget/
│   └── integration/
│
├── docs/                              # Documentación
│   ├── INDEX.md
│   ├── DEVELOPER_README.md
│   └── screenshots/
│
├── android/                           # Proyecto Android
├── ios/                               # Proyecto iOS
├── web/                               # Proyecto Web
├── linux/                             # Proyecto Linux
├── macos/                             # Proyecto macOS
├── windows/                           # Proyecto Windows
│
├── .vscode/                           # Configuración VS Code
│   └── mcp.json                       # Configuración Figma MCP
│
├── pubspec.yaml                       # Dependencias
├── analysis_options.yaml              # Reglas de linting
└── README.md                          # Documentación principal
```

## 🎨 Sistema de Diseño

### Colores

Definidos en `lib/theme/app_colors.dart`:

```dart
class AppColors {
  // Primary Colors
  static const Color cream = Color(0xFFFFFBF5);
  static const Color greenQuartz = Color(0xFF658079);
  static const Color softPeach = Color(0xFFFFDFCA);
  static const Color terracotta = Color(0xFFCD6750);
  
  // Accent Colors
  static const Color yellowAccent = Color(0xFFFFC439);
  static const Color paleYellow = Color(0xFFFFF4E0);
  
  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  
  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
}
```

### Tipografía

Inter Variable Font con pesos de 100 a 900:

```dart
class AppTypography {
  static const String fontFamily = 'Inter';
  
  // Display
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 57,
    fontWeight: FontWeight.w400,
  );
  
  // Headline
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );
  
  // Body
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  
  // Label
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
```

### Espaciado

Sistema basado en 8px:

```dart
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}
```

### Border Radius

```dart
class AppRadius {
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double circular = 9999.0;
}
```

## 🔄 Gestión de Estado

Actualmente usando **StatefulWidget** para estado local. Recomendaciones para escalabilidad:

### Para estado simple:
- `StatefulWidget` ✅ (actual)
- `ChangeNotifier` con `Provider`

### Para estado complejo:
- `Riverpod` 🎯 (recomendado para futuro)
- `Bloc` (para apps grandes)

### Ejemplo con StatefulWidget:

```dart
class CardDetailScreen extends StatefulWidget {
  @override
  State<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {
  bool _isExpanded = false;
  
  void _toggleExpanded() {
    setState(() => _isExpanded = !_isExpanded);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: // ... UI
    );
  }
}
```

## 🧭 Navegación

Usando **go_router** para navegación declarativa:

```dart
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/card/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return CardDetailScreen(id: id);
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
```

### Navegación programática:

```dart
// Navegar
context.go('/card/123');

// Navegar con push
context.push('/profile');

// Regresar
context.pop();
```

## ✨ Animaciones

### Hero Animations

```dart
// Origen
Hero(
  tag: 'card-$cardIndex',
  child: Image.network(imageUrl),
)

// Destino
Hero(
  tag: 'card-$cardIndex',
  child: Image.network(imageUrl),
)
```

### AnimationController

```dart
class _MyWidgetState extends State<MyWidget> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

### Implicit Animations

```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  curve: Curves.easeInOut,
  height: _isExpanded ? 500 : 200,
)

AnimatedOpacity(
  duration: const Duration(milliseconds: 200),
  opacity: _isVisible ? 1.0 : 0.0,
  child: child,
)
```

## 🎨 Integración con Figma

### Configuración MCP

Archivo `.vscode/mcp.json`:

```json
{
  "figma": {
    "url": "https://www.figma.com/design/DePsSadNq9CKSGwldrgWCt/Zaia-app?node-id=603-3289",
    "fileKey": "DePsSadNq9CKSGwldrgWCt",
    "nodeId": "603:3289"
  }
}
```

### Workflow con Figma:

1. **Diseño en Figma** → Diseñadores crean/actualizan
2. **Revisar en VS Code** → Usar extensión de Figma
3. **Extraer código** → Copilot genera código Flutter
4. **Ajustar y refinar** → Adaptar a la arquitectura
5. **Commit y PR** → Seguir proceso de Git

## 🧪 Testing

### Estructura de Tests

```
test/
├── unit/                    # Tests unitarios
│   ├── models/
│   ├── services/
│   └── utils/
├── widget/                  # Tests de widgets
│   ├── screens/
│   └── widgets/
└── integration/             # Tests de integración
    └── user_flows/
```

### Comandos de Testing

```bash
# Ejecutar todos los tests
flutter test

# Ejecutar tests específicos
flutter test test/unit/models/

# Ejecutar con coverage
flutter test --coverage

# Ver coverage en HTML
genhtml coverage/lcov.info -o coverage/html
```

### Ejemplo de Test Unitario

```dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Challenge Model', () {
    test('should create a valid challenge', () {
      final challenge = Challenge(
        id: '1',
        title: 'Test Challenge',
        description: 'Description',
      );
      
      expect(challenge.id, '1');
      expect(challenge.title, 'Test Challenge');
    });
  });
}
```

### Ejemplo de Widget Test

```dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CardDetailScreen displays correctly', 
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CardDetailScreen(
          imageUrl: 'test.jpg',
          text: 'Test',
          category: 'Wellness',
          cardIndex: 0,
        ),
      ),
    );
    
    expect(find.text('Test'), findsOneWidget);
  });
}
```

## 🚀 CI/CD

### GitHub Actions (Recomendado)

Crear `.github/workflows/flutter.yml`:

```yaml
name: Flutter CI

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main, develop ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.9.2'
    
    - run: flutter pub get
    - run: flutter analyze
    - run: flutter test
    - run: flutter build apk --release
```

### Workflow de Desarrollo

```
main (producción)
  ↑
develop (staging)
  ↑
feature/nueva-funcionalidad
```

## ✅ Mejores Prácticas

### Código Limpio

```dart
// ✅ BIEN: Nombres descriptivos
class UserProfileScreen extends StatelessWidget {
  final User user;
  
  const UserProfileScreen({required this.user, super.key});
}

// ❌ MAL: Nombres ambiguos
class Screen2 extends StatelessWidget {
  final dynamic d;
}
```

### Manejo de Assets

```dart
// ✅ BIEN: Constantes para assets
class AppAssets {
  static const String logo = 'assets/images/logo.svg';
  static const String placeholder = 'assets/images/placeholder.png';
}

// Uso
SvgPicture.asset(AppAssets.logo)
```

### Widgets Reutilizables

```dart
// ✅ BIEN: Widget parametrizable
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  
  const CustomButton({
    required this.text,
    required this.onPressed,
    this.color,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.terracotta,
      ),
      child: Text(text),
    );
  }
}
```

### Gestión de Memoria

```dart
// ✅ BIEN: Dispose de controllers
@override
void dispose() {
  _scrollController.dispose();
  _animationController.dispose();
  super.dispose();
}
```

## 🐛 Troubleshooting

### Problema: "Failed to load asset"

**Solución:**
```bash
flutter clean
flutter pub get
flutter run
```

### Problema: SVG no se muestra

**Causa:** Variables CSS en el SVG

**Solución:**
```bash
sed 's/fill="var(--fill-0, black)"/fill="black"/g' input.svg > output.svg
```

### Problema: Hot reload no funciona

**Solución:**
```bash
# Restart completo
r (en terminal de flutter run)

# O
flutter run --no-hot-reload
```

### Problema: Dependencias desactualizadas

```bash
flutter pub upgrade --major-versions
flutter pub outdated
```

### Problema: Iconos de app no se actualizan

```bash
flutter clean
flutter pub run flutter_launcher_icons
flutter run
```

## 📚 Recursos Adicionales

### Documentación Oficial

- [Flutter Docs](https://docs.flutter.dev/)
- [Dart Docs](https://dart.dev/guides)
- [Material Design 3](https://m3.material.io/)

### Comunidad

- [Flutter Discord](https://discord.gg/flutter)
- [r/FlutterDev](https://reddit.com/r/FlutterDev)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter)

### Herramientas Útiles

- [FlutterGems](https://fluttergems.dev/) - Paquetes curados
- [Pub.dev](https://pub.dev/) - Repositorio de paquetes
- [Widget of the Week](https://youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG) - Videos semanales

---

**Última actualización:** Noviembre 2025  
**Mantenido por:** APPSYNC Development Team
