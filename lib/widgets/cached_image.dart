import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';

/// Widget para cargar imágenes de red con caché automático
///
/// Funciona en debug y release, cachea las imágenes localmente para:
/// - Mejor rendimiento (carga instantánea)
/// - Funciona offline una vez cacheada
/// - Actualiza automáticamente si la URL cambia
class CachedImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>
          placeholder ??
          Center(
            child: SizedBox(
              width: 24.w,
              height: 24.h,
              child: CircularProgressIndicator(strokeWidth: 2.r, color: AppColors.accent),
            ),
          ),
      errorWidget: (context, url, error) {
        // Debug: imprime el error en consola
        debugPrint('Error cargando imagen: $url - Error: $error');
        return errorWidget ??
            Container(
              width: width,
              height: height,
              color: AppColors.grey200,
              child: Center(
                child: Icon(Icons.broken_image_outlined, color: AppColors.grey400, size: 32.sp),
              ),
            );
      },
      // Optimizaciones de memoria
      memCacheWidth: (width != null && width!.isFinite) ? (width! * 2.0).toInt() : null,
      memCacheHeight: (height != null && height!.isFinite) ? (height! * 2.0).toInt() : null,
      // Duración del caché: 7 días
      maxHeightDiskCache: 1000,
      maxWidthDiskCache: 1000,
    );
  }
}

/// ImageProvider para usar con DecorationImage
class CachedImageProvider extends CachedNetworkImageProvider {
  const CachedImageProvider(super.url);
}
