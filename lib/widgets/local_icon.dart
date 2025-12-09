import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Widget para mostrar íconos SVG locales
class LocalIcon extends StatelessWidget {
  // Nombre del ícono en formato iconify: "material-symbols-light:search-rounded"
  final String icon;
  final double? size;
  final Color? color;

  const LocalIcon({super.key, required this.icon, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    try {
      //  Convertir: "material-symbols-light:search-rounded" -> "material-symbols-light_search-rounded.svg"
      final iconFileName = icon.replaceAll(':', '_').replaceAll('/', '_');
      final assetPath = 'assets/icons/$iconFileName.svg';

      return SvgPicture.asset(
        assetPath,
        width: size,
        height: size,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        placeholderBuilder: (context) => Icon(Icons.help_outline, size: size, color: color ?? Colors.grey),
      );
    } catch (e) {
      debugPrint('Error cargando ícono local: $icon - Error: $e');
      return Icon(Icons.broken_image, size: size, color: color ?? Colors.grey);
    }
  }
}
