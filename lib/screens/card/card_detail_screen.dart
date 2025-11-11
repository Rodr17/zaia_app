import 'dart:developer' as developer;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconify_design/iconify_design.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../theme/app_constants.dart';

class CardDetailScreen extends StatefulWidget {
  final String imageUrl;
  final String text;
  final String category;
  final int cardIndex;

  const CardDetailScreen({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.category,
    required this.cardIndex,
  });

  @override
  State<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> with SingleTickerProviderStateMixin {
  final DraggableScrollableController _scrollController = DraggableScrollableController();
  bool _isExpanded = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Solo cambiar el estado cuando se alcance exactamente el snap size
      // developer.log(_scrollController.size.toString());
    if (_scrollController.size >= 0.92 && !_isExpanded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() => _isExpanded = true);
          _animationController.forward();
        }
      });
    } else if (_scrollController.size <= 0.80 && _isExpanded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() => _isExpanded = false);
          _animationController.reverse();
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    if (!_scrollController.isAttached) return;

    if (_isExpanded) {
      _scrollController.animateTo(0.80, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    } else {
      _scrollController.animateTo(0.92, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          // Contenedor circular con desenfoque amarillo
          Positioned(
            top: 400,
            left: size.width / 2 - 200,
            child: ClipOval(
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFC439),
                  gradient: RadialGradient(
                    center: Alignment.center,
                    colors: [
                      Color(0xFFFFC439).withValues(alpha: .8),
                      Color(0xFFFFC439).withValues(alpha: .6),
                      Color.fromARGB(255, 255, 225, 164),
                      Color.fromARGB(255, 255, 235, 197),
                      Color.fromARGB(255, 255, 247, 230),
                      Color.fromARGB(255, 255, 253, 248),
                    ],
                    // stops: const [.2, .4, .6, .8, 1],
                  ),
                ),
              ),
            ),
          ),

          // Imagen de fondo (visible solo en estado expandido, sin padding)
          if (_isExpanded)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: size.height * 0.45,
              child: ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Imagen
                    Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.grey300,
                          child: const Center(child: Icon(Icons.image, size: 48, color: AppColors.grey500)),
                        );
                      },
                    ),
                    // Texto con glassmorphism
                    Positioned(
                      left: 24,
                      right: 24,
                      bottom: 24,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 1),
                            ),
                            child: Text(
                              widget.text,
                              style: AppTypography.bodyMedium.copyWith(
                                color: Colors.white,
                                height: 1.5,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Botones de acción arriba
          if (_isExpanded)
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.arrow_back, color: Colors.black87, size: 22),
                      ),
                    ),
                    Row(
                      children: [
                        _buildActionButton(Icons.share_outlined),
                        SizedBox(width: AppSpacing.sm),
                        _buildActionButton(Icons.favorite_border),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          // Contenedor con imagen y panel deslizable
          DraggableScrollableSheet(
            controller: _scrollController,
            initialChildSize: 0.80,
            minChildSize: 0.80,
            maxChildSize: 0.92,
            snap: true,
            snapSizes: const [0.80, 0.92],
            builder: (context, scrollController) {
              if (_isExpanded) {
                // Modo expandido: imagen fija arriba, contenido scrolleable abajo
                return Column(
                  children: [
                    // Espacio fijo para la imagen de fondo
                    SizedBox(height: size.height * 0.40),
                    // Contenido scrolleable
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        physics: const ClampingScrollPhysics(),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.transparent),
                          padding: EdgeInsets.fromLTRB(AppSpacing.xl, AppSpacing.xl, AppSpacing.xl, AppSpacing.xxl),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Título Descripción
                              Text(
                                'Descripción',
                                style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: AppSpacing.md),
                              // Texto descripción
                              Text(
                                'Hacer una pausa consciente y llenar los pulmones de aire, ayuda a oxigenar el cuerpo y la mente. Deja ir el estrés, las preocupaciones o cualquier carga emocional que estemos experimentando. Anímate a recibir la tranquilidad con apertura, permitiendo que la paz interior nos envuelva y nos guíe hacia un estado de mayor equilibrio y serenidad.',
                                style: AppTypography.bodyMedium.copyWith(color: AppColors.grey900, height: 1.6),
                              ),
                              SizedBox(height: AppSpacing.xl),

                              // Título Reto
                              Text('Reto', style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.w700)),
                              SizedBox(height: AppSpacing.md),
                              // Texto reto
                              Text(
                                'Hacer meditación por lo menos 5 minutos, en un lugar sereno y tranquilo, que te genere paz. Se consciente de tu respiración y pensamientos que recorren tu mente durante estos 5 minutos, y suéltalos.',
                                style: AppTypography.bodyMedium.copyWith(color: AppColors.grey900, height: 1.6),
                              ),
                              SizedBox(height: AppSpacing.xxl),

                              // Botón Reto cumplido (amarillo)
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).popUntil((route) => route.isFirst);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFFC53D),
                                    foregroundColor: Colors.black87,
                                    padding: EdgeInsets.symmetric(vertical: 18),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    'Reto cumplido',
                                    style: AppTypography.titleMedium.copyWith(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }

              // Modo minimizado: scroll normal con imagen y flecha
              return SingleChildScrollView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  spacing: AppSpacing.lg,
                  children: [
                    // Logo ZAIA
                    SvgPicture.asset(
                      'assets/images/zaia_logo.min.svg',
                      width: size.width * 0.5,
                      height: 30,
                      fit: BoxFit.contain,
                    ),

                    // Imagen con Hero
                    if (!_isExpanded)
                      Hero(
                        tag: 'card_${widget.category}_${widget.cardIndex}',
                        child: Container(
                          height: 450,
                          margin: EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.15),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                // Imagen
                                Image.network(
                                  widget.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: AppColors.grey300,
                                      child: const Center(child: Icon(Icons.image, size: 48, color: AppColors.grey500)),
                                    );
                                  },
                                ),
                                // Gradiente oscuro
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withValues(alpha: 0.4),
                                        Colors.black.withValues(alpha: 0.7),
                                      ],
                                      stops: const [0.4, 0.7, 1.0],
                                    ),
                                  ),
                                ),
                                // Texto con glassmorphism
                                Positioned(
                                  left: 24,
                                  right: 24,
                                  bottom: 24,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withValues(alpha: 0.2),
                                          borderRadius: BorderRadius.circular(24),
                                          border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 1),
                                        ),
                                        child: Text(
                                          widget.text,
                                          style: AppTypography.bodyLarge.copyWith(
                                            color: Colors.white,
                                            height: 1.5,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    // Flecha indicadora
                    GestureDetector(
                      onTap: _toggleExpanded,
                      child: IconifyIcon(icon: 'icon-park-outline:up', size: 40, color: AppColors.surface),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.3), shape: BoxShape.circle),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
        ),
      ),
    );
  }
}
