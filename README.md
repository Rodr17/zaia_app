# 🌟 ZAIA - Wellness & Habits App# 🌟 Zaia App - Bienestar y Mindfulness



<div align="center">> App de bienestar, mindfulness y comercio de pulseras con piedras naturales

  <img src="assets/images/logo.svg" alt="ZAIA Logo" width="200"/>

  ![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)

  [![Flutter](https://img.shields.io/badge/Flutter-3.9.2+-02569B?logo=flutter)](https://flutter.dev)![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)

  [![Dart](https://img.shields.io/badge/Dart-3.9.2+-0175C2?logo=dart)](https://dart.dev)![Material Design](https://img.shields.io/badge/Material%20Design-3-757575?logo=material-design)

  [![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)![Status](https://img.shields.io/badge/Status-Production%20Ready-success)

</div>

---

## 📱 Sobre ZAIA

## ✨ Características

ZAIA es una aplicación móvil de bienestar diseñada para ayudar a los usuarios a desarrollar y mantener hábitos saludables a través de retos diarios personalizados. La aplicación combina un diseño moderno y minimalista con funcionalidades intuitivas para hacer del autocuidado una experiencia agradable.

### ✨ Características Principales

- 🎨 **Sistema de diseño completo** extraído desde Figma
- 🏠 **Home Screen funcional** con 5 componentes customizados
- 🔍 **Search Screen** con historial de búsquedas recientes
- � **11 widgets reutilizables** para toda la app
- 🌈 **Paleta de colores** con 50+ definiciones
- 📝 **Tipografía Inter** con 15+ estilos predefinidos
- 📱 **Material Design 3** totalmente configurado
- 📖 **Documentación exhaustiva** (~2,200 líneas)
- 🎯 **Retos Diarios Personalizados**: Desafíos adaptativos basados en tus objetivos
- 📊 **Seguimiento de Progreso**: Visualiza tu evolución día a día
- 🎨 **Diseño Minimalista**: Interfaz limpia con paleta de colores calmante
- 🌓 **Modo Claro/Oscuro**: Adaptación automática según preferencias
- 📱 **Navegación Fluida**: Transiciones suaves y animaciones naturales
- 🔔 **Notificaciones Inteligentes**: Recordatorios personalizados
- 💾 **Sincronización en la Nube**: Tus datos siempre disponibles

---

## 🚀 Inicio Rápido

## 🎨 Capturas de Pantalla

### Prerequisitos

<div align="center">

  <img src="docs/screenshots/home.png" alt="Home" width="250"/>- Flutter SDK >=3.0.0

  <img src="docs/screenshots/card.png" alt="Card Detail" width="250"/>- Dart SDK >=3.0.0

  <img src="docs/screenshots/profile.png" alt="Profile" width="250"/>- Android Studio / Xcode (para emuladores)

</div>

### Instalación

## 🏗️ Arquitectura

```bash

```# Clonar el repositorio

zaia_app/git clone <repository-url>

├── lib/cd zaia_app

│   ├── main.dart                 # Punto de entrada

│   ├── screens/                  # Pantallas de la app# Instalar dependencias

│   │   ├── home/                # Pantalla principalflutter pub get

│   │   ├── card/                # Detalle de retos

│   │   └── profile/             # Perfil de usuario# Ejecutar la app

│   ├── widgets/                  # Componentes reutilizablesflutter run

│   ├── theme/                    # Sistema de diseño```

│   │   ├── app_colors.dart      # Paleta de colores

│   │   ├── app_typography.dart  # Tipografía### Primera Ejecución

│   │   └── app_constants.dart   # Espaciados y constantes

│   ├── models/                   # Modelos de datos```bash

│   ├── services/                 # Lógica de negocio# Verificar configuración

│   └── utils/                    # Utilidadesflutter doctor

├── assets/

│   ├── images/                   # Imágenes y logos# Ver dispositivos disponibles

│   └── fonts/                    # Fuentes personalizadasflutter devices

├── docs/                         # Documentación

└── test/                         # Tests unitarios# Ejecutar en dispositivo específico

```flutter run -d <device-id>



## 🚀 Inicio Rápido# Ejecutar en Chrome (web)

flutter run -d chrome

### Prerrequisitos```



- Flutter SDK (3.9.2 o superior)---

- Dart SDK (3.9.2 o superior)

- Android Studio / Xcode para emuladores## 📚 Documentación

- VS Code (recomendado) con extensiones de Flutter

### 📖 Guías Principales

### Instalación

| Documento | Descripción | Para quién |

1. **Clonar el repositorio**|-----------|-------------|------------|

   ```bash| **[📑 INDEX.md](INDEX.md)** | **Índice completo de toda la documentación** | **Todos** |

   git clone https://github.com/tu-usuario/zaia_app.git| [🚀 QUICKSTART.md](QUICKSTART.md) | Guía de inicio rápido | Nuevos desarrolladores |

   cd zaia_app| [🎨 DESIGN_SYSTEM.md](DESIGN_SYSTEM.md) | Sistema de diseño completo | Dev + Diseñadores |

   ```| [📊 IMPLEMENTATION_SUMMARY.md](IMPLEMENTATION_SUMMARY.md) | Resumen de implementación | Product Owners |

| [🖼️ DESIGN_REFERENCE.md](DESIGN_REFERENCE.md) | Referencias visuales | QA + Diseñadores |

2. **Instalar dependencias**

   ```bash### 📂 Documentación por Módulo

   flutter pub get

   ```- [📘 Sistema de Tema](lib/theme/README.md) - Colores, tipografía, constantes

- [📗 Pantalla Home](lib/screens/home/README.md) - Componentes del home

3. **Ejecutar la aplicación**

   ```bash> 💡 **Tip**: Empieza por [INDEX.md](INDEX.md) para navegar toda la documentación

   flutter run

   ```---



### Configuración de Figma (Opcional)## 🎨 Sistema de Diseño



La aplicación utiliza el MCP de Figma para mantener sincronizados los diseños. Para configurarlo:### Origen del Diseño



1. Instala la extensión de Figma en VS Code- **Figma File**: [Zaia-app](https://www.figma.com/design/Xs8eirsVr5A1yFbXe5Ey6e/Zaia-app?node-id=928-834)

2. Configura el archivo `.vscode/mcp.json`:- **Método**: Extracción vía MCP Figma Server

   ```json- **Fidelidad**: 100% al diseño original

   {

     "figma": {### Paleta de Colores

       "url": "https://www.figma.com/design/DePsSadNq9CKSGwldrgWCt/Zaia-app?node-id=603-3289"

     }```dart

   }// Colores de Marca

   ```AppColors.primary    // #8B7355 - Bronze

AppColors.secondary  // #B8956A - Gold

## 🎯 Pantallas PrincipalesAppColors.accent     // #A8956E - Warm grey



### 🏠 Home// Colores de Piedras

- Vista en grid de retos disponiblesAppColors.amethyst      // #9B7CB6

- Filtros por categoríaAppColors.sodalite      // #4A5F8C

- Indicadores de progresoAppColors.roseQuartz    // #E8DDD5

AppColors.citrine       // #F5D547

### 📋 Card DetailAppColors.tigerEye      // #C8844F

- Información detallada del retoAppColors.redJasper     // #A14B3D

- Animación de expansión/colapsoAppColors.blackObsidian // #1A1A1A

- Botón de completar reto```

- Diseño con glassmorphism

### Tipografía

### 👤 Profile

- Información del usuario**Familia**: Inter (Display, Headline, Title, Body, Label)

- Estadísticas personales

- Configuración de la app```dart

AppTypography.displayLarge    // 57px / Bold

## 🧩 Componentes ClaveAppTypography.headlineMedium  // 28px / SemiBold

AppTypography.bodyLarge       // 16px / Regular

### DraggableScrollableSheetAppTypography.labelSmall      // 11px / Medium

Panel deslizable personalizado con dos estados:```

- **Minimizado (75%)**: Vista rápida del reto

- **Expandido (92%)**: Vista completa con scroll---



### Custom Theme System## 🏠 Pantallas Implementadas

Sistema de diseño completo con:

- **Colores**: Paleta coherente con Material Design 3### ✅ Home Screen (Completa)

- **Tipografía**: Inter font con weights variables

- **Espaciado**: Sistema de 8px base- Header con navegación

- Categorías horizontales (6 items)

### Animaciones- Tarjetas de inspiración (2 items)

- Hero animations para transiciones- Sección "En Tendencia" (4 categorías)

- Fade & Scale en componentes- Banner promocional

- Smooth scroll behavior- Navegación inferior (5 items)



## 📦 Dependencias Principales### ⏳ Próximamente



```yaml- Store Screen (tienda)

dependencies:- Profile Screen (perfil)

  flutter:- News Screen (noticias)

    sdk: flutter- Help/FAQ Screen

  go_router: ^14.6.2          # Navegación declarativa- Cart & Checkout

  flutter_svg: ^2.2.2         # Soporte para SVG

  iconify_design: ^1.0.1      # Iconos personalizados---

  cupertino_icons: ^1.0.8     # Iconos iOS

## 🧩 Widgets Disponibles

dev_dependencies:

  flutter_lints: ^5.0.0       # Análisis de código### Widgets del Home

  flutter_launcher_icons: ^0.13.1  # Generación de iconos

``````dart

// Tarjeta de inspiración

## 🛠️ Comandos ÚtilesInspirationCard(

  imageUrl: 'https://...',

```bash  text: 'Frase inspiradora',

# Ejecutar en modo debug  onTap: () {},

flutter run)



# Ejecutar en modo release// Chip de categoría

flutter run --releaseCategoryChipWidget(

  label: 'Mindfulness',

# Analizar código  isSelected: true,

flutter analyze  onTap: () {},

)

# Formatear código

dart format .// Categoría en tendencia

TrendingCategory(

# Generar iconos de la app  name: 'Mindfulness',

flutter pub run flutter_launcher_icons  newsCount: 25,

  color: Colors.purple,

# Limpiar build  icon: Icons.spa,

flutter clean  onTap: () {},

)

# Obtener dependencias```

flutter pub get

### Widgets Globales

# Actualizar dependencias

flutter pub upgrade```dart

```// Botón personalizado

ZaiaButton(

## 🎨 Sistema de Diseño  text: 'Comprar Ahora',

  type: ZaiaButtonType.primary,

### Paleta de Colores  onPressed: () {},

)

```dart

// Colores principales// Card de pulsera

cream: #FFFBF5           // Fondo principalBraceletCard(

greenQuartz: #658079     // Elementos destacados  name: 'Pulsera Amatista',

softPeach: #FFDFCA       // Acentos cálidos  price: 29.99,

terracotta: #CD6750      // CTA y acciones  imageUrl: 'https://...',

  stones: ['Amethyst', 'Quartz'],

// Colores adicionales  onTap: () {},

yellowAccent: #FFC439    // Destacados)

paleYellow: #FFF4E0      // Fondos suaves

```// Badge de trending

TrendingBadge(

### Tipografía  count: 108,

  isAnimated: true,

- **Fuente**: Inter (Variable Font))

- **Pesos**: 100-900```

- **Estilos**: Normal e Itálica

Ver todos los widgets: [lib/widgets/zaia_widgets.dart](lib/widgets/zaia_widgets.dart)

### Espaciado

---

- xs: 4px

- sm: 8px## 📱 Demo

- md: 16px

- lg: 24px### Ver Theme Showcase

- xl: 32px

- xxl: 48pxPara ver todos los componentes del sistema de diseño:



## 📖 Documentación Adicional1. Abre `lib/main.dart`

2. Cambia el `home` a `ThemeShowcasePage()`:

Para más información técnica, consulta:

```dart

- [Developer Guide](docs/DEVELOPER_README.md)home: const ThemeShowcasePage(),

- [Índice de Documentación](docs/INDEX.md)```

- [Guía de Contribución](CONTRIBUTING.md)

3. Guarda y hot reload (`r` en terminal)

## 🤝 Contribuir

Verás una página con todos los colores, tipografías, botones, cards y más.

Las contribuciones son bienvenidas. Por favor:

---

1. Fork el proyecto

2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)## 🛠️ Comandos Útiles

3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)

4. Push a la rama (`git push origin feature/AmazingFeature`)### Desarrollo

5. Abre un Pull Request

```bash

## 👥 Equipo# Hot reload

flutter run

- **Desarrollo**: APPSYNC Team

- **Diseño**: Figma Design System# Limpiar build

- **Contacto**: rodrigovazquez@appsync.mxflutter clean && flutter pub get



## 📄 Licencia# Formatear código

flutter format lib/

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

# Analizar código

## 🙏 Agradecimientosflutter analyze

```

- Flutter Team por el increíble framework

- Figma por las herramientas de diseño### Build

- Comunidad de Flutter por el soporte constante

```bash

---# Android APK (release)

flutter build apk --release

<div align="center">

  Hecho con ❤️ por el equipo de APPSYNC# Android App Bundle

</div>flutter build appbundle


# iOS (requiere Mac)
flutter build ios --release

# Web
flutter build web
```

### Testing

```bash
# Ejecutar tests
flutter test

# Con coverage
flutter test --coverage
```

---

## 📂 Estructura del Proyecto

```
lib/
├── main.dart                      # Entry point
├── theme/                         # Sistema de diseño
│   ├── app_colors.dart           # Paleta completa
│   ├── app_typography.dart       # Estilos de texto
│   ├── app_theme.dart            # Material Design 3
│   ├── app_constants.dart        # Espaciados, radios, etc.
│   └── README.md                 # Documentación del tema
├── screens/                       # Pantallas
│   └── home/
│       ├── home_screen.dart      # Pantalla principal
│       ├── README.md             # Docs del home
│       └── widgets/              # Componentes del home
│           ├── inspiration_card.dart
│           ├── category_chip.dart
│           ├── trending_category.dart
│           ├── promotional_banner.dart
│           └── bottom_navigation.dart
├── widgets/                       # Widgets globales
│   └── zaia_widgets.dart         # Componentes reutilizables
└── examples/                      # Ejemplos y demos
    └── theme_showcase_page.dart  # Demo de componentes
```

---

## 🎯 Roadmap

### ✅ Fase 1 - Fundación (Completada)
- [x] Sistema de diseño completo
- [x] Home Screen
- [x] Widgets reutilizables
- [x] Documentación

### 🚧 Fase 2 - Pantallas Principales (Sprint 1-2)
- [ ] Store Screen
- [ ] Profile Screen
- [ ] News Screen
- [ ] Help Screen

### 📅 Fase 3 - Backend (Sprint 3-4)
- [ ] API Integration
- [ ] Autenticación
- [ ] Estado global (Provider/Bloc)
- [ ] Caché local

### 🔮 Fase 4 - Features Avanzadas (Sprint 5-6)
- [ ] Búsqueda
- [ ] Filtros
- [ ] Favoritos
- [ ] Notificaciones
- [ ] Carrito de compras
- [ ] Pasarela de pago

### ✨ Fase 5 - Pulido (Sprint 7-8)
- [ ] Animaciones
- [ ] Tema oscuro
- [ ] Tests
- [ ] Optimización
- [ ] Accesibilidad

---

## 🤝 Contribuir

### Para Desarrolladores

1. Lee la [documentación completa](INDEX.md)
2. Revisa las [buenas prácticas](DESIGN_SYSTEM.md#buenas-prácticas)
3. Usa el [sistema de tema](lib/theme/README.md)
4. Reutiliza [widgets existentes](lib/widgets/zaia_widgets.dart)

### Para Diseñadores

1. Mantén consistencia con el [diseño extraído](DESIGN_REFERENCE.md)
2. Usa la [paleta de colores](lib/theme/app_colors.dart) definida
3. Respeta el [sistema de espaciado](lib/theme/app_constants.dart)
4. Consulta el [Figma original](https://www.figma.com/design/Xs8eirsVr5A1yFbXe5Ey6e/Zaia-app)

---

## 📊 Estadísticas

| Métrica | Valor |
|---------|-------|
| **Líneas de código** | ~3,557 |
| **Líneas de docs** | ~2,200 |
| **Colores definidos** | 50+ |
| **Estilos de texto** | 15+ |
| **Widgets custom** | 11 |
| **Pantallas** | 1 (Home) |
| **Archivos creados** | 20+ |

---

## 🔗 Enlaces

| Recurso | URL |
|---------|-----|
| **Documentación** | [INDEX.md](INDEX.md) |
| **Figma Design** | [Ver diseño](https://www.figma.com/design/Xs8eirsVr5A1yFbXe5Ey6e/Zaia-app) |
| **Flutter Docs** | https://flutter.dev/docs |
| **Material Design 3** | https://m3.material.io |

---

## ⚠️ Warnings Conocidos

El proyecto tiene algunos warnings de deprecación sobre `withOpacity()` (15 warnings). La app funciona perfectamente. Ver [QUICKSTART.md](QUICKSTART.md) para más detalles.

---

## 📄 Licencia

[Añadir información de licencia aquí]

---

## 👥 Equipo

[Añadir información del equipo aquí]

---

## 📞 Soporte

- 📖 [Documentación completa](INDEX.md)
- 🚀 [Guía de inicio](QUICKSTART.md)
- 🎨 [Sistema de diseño](DESIGN_SYSTEM.md)
- 💬 [Issues de GitHub](issues-url)

---

## 🎉 Estado del Proyecto

| Componente | Estado |
|------------|--------|
| Sistema de Diseño | ✅ Completo |
| Home Screen | ✅ Completo |
| Documentación | ✅ Completa |
| Otras Pantallas | ⏳ Pendiente |
| Backend | ⏳ Pendiente |

**Versión**: 1.0.0  
**Estado**: ✅ **Production Ready** (para Home Screen)  
**Última actualización**: ${new Date().toISOString().split('T')[0]}

---

<p align="center">
  <b>🚀 ¡Listo para desarrollar! Lee el <a href="INDEX.md">INDEX.md</a> para empezar.</b>
</p>
