import 'package:flutter/material.dart';
import 'package:iconify_design/iconify_design.dart';
import 'package:zaia_app/theme/app_typography.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        actions: [
          IconButton(
            icon: IconifyIcon(icon: 'clarity:edit-line', color: AppColors.grey800),
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColors.grey200)),
            onPressed: () => {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppSpacing.lg),
            // Avatar y nombre
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
                    ),
                    child: const Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  SizedBox(height: AppSpacing.md),
                  Text('Usuario', style: AppTypography.headlineSmall.copyWith(fontWeight: FontWeight.w700)),
                  SizedBox(height: AppSpacing.xs),
                  Text(
                    'usuario@ejemplo.com',
                    style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl),
            // Estadísticas
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Row(
                children: [
                  Expanded(
                    child: _StatCard(icon: Icons.self_improvement, value: '24', label: 'Sesiones'),
                  ),
                  SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: _StatCard(icon: Icons.local_fire_department, value: '7', label: 'Días seguidos'),
                  ),
                  SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: _StatCard(icon: Icons.timer, value: '180', label: 'Minutos'),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.xl),
            // Opciones del menú
            _MenuSection(
              title: 'Mi Actividad',
              items: [
                _MenuItem(icon: Icons.history, title: 'Historial', onTap: () {}),
                _MenuItem(icon: Icons.favorite_outline, title: 'Favoritos', onTap: () {}),
                _MenuItem(icon: Icons.emoji_events_outlined, title: 'Logros', onTap: () {}),
              ],
            ),
            SizedBox(height: AppSpacing.lg),
            _MenuSection(
              title: 'Configuración',
              items: [
                _MenuItem(icon: Icons.notifications_outlined, title: 'Notificaciones', onTap: () {}),
                _MenuItem(icon: Icons.language, title: 'Idioma', onTap: () {}),
                _MenuItem(icon: Icons.privacy_tip_outlined, title: 'Privacidad', onTap: () {}),
              ],
            ),
            SizedBox(height: AppSpacing.lg),
            _MenuSection(
              title: 'Soporte',
              items: [
                _MenuItem(icon: Icons.help_outline, title: 'Ayuda', onTap: () {}),
                _MenuItem(icon: Icons.info_outline, title: 'Acerca de', onTap: () {}),
              ],
            ),
            SizedBox(height: AppSpacing.xl),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: OutlinedButton(
                onPressed: () => {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppBorderRadius.lg)),
                ),
                child: const Text('Cerrar sesión'),
              ),
            ),
            SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatCard({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppBorderRadius.lg)),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary, size: 28),
          SizedBox(height: AppSpacing.sm),
          Text(value, style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.w700)),
          SizedBox(height: AppSpacing.xs),
          Text(
            label,
            style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _MenuSection extends StatelessWidget {
  final String title;
  final List<_MenuItem> items;

  const _MenuSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Text(
            title,
            style: AppTypography.titleSmall.copyWith(fontWeight: FontWeight.w600, color: AppColors.textSecondary),
          ),
        ),
        SizedBox(height: AppSpacing.sm),
        Container(
          margin: EdgeInsets.symmetric(horizontal: AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppBorderRadius.lg)),
          child: Column(
            children: items
                .map(
                  (item) => Column(
                    children: [
                      item,
                      if (item != items.last) Divider(height: 1, color: AppColors.surfaceVariant),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _MenuItem({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppBorderRadius.lg),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.md),
        child: Row(
          children: [
            Icon(icon, color: AppColors.textSecondary),
            SizedBox(width: AppSpacing.md),
            Expanded(child: Text(title, style: AppTypography.bodyLarge)),
            Icon(Icons.chevron_right, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
