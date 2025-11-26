import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_design/iconify_design.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../models/user_profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Usuario de ejemplo (en producción vendría de un estado global o API)
  final UserProfileModel _user = UserProfileModel(
    id: '1',
    name: 'Yareli García',
    email: 'yareligarcia@gmail.com',
    location: 'Monterrey, NL.',
    profileImageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400',
    coverImageUrl: 'https://images.unsplash.com/photo-1708347237870-2d007557b7a4?w=800',
    favoritePhrase:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    skills: ['Valiente', 'Generosa', 'Honesta', 'Diciplinada', 'Honrada', 'Delicada'],
    completedChallenges: List.generate(7, (index) => 'challenge_$index'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header con imagen de fondo y avatar
              _buildHeader(context),

              // 32 foto perfil + 8
              SizedBox(height: 40.h),

              // Nombre
              Center(
                child: Text(
                  _user.name,
                  style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),

              SizedBox(height: 4.h),

              // Email
              Center(
                child: Text(
                  _user.email,
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black),
                ),
              ),

              SizedBox(height: 5.h),

              // Ubicación
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconifyIcon(icon: 'weui:location-outlined', size: 16.sp, color: Colors.black),
                    
                    SizedBox(width: 4.w),
                    
                    Text(
                      _user.location,
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 14.h),

              // Frase favorita
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text('Frase favorita', style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.w600)),
              ),

              SizedBox(height: 8.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  _user.favoritePhrase ?? '',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    height: 1.4,
                    letterSpacing: 0.24,
                  ),
                ),
              ),

              SizedBox(height: 32.h),
        
              // Habilidades
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text('Habilidades', style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.w600)),
              ),

              SizedBox(height: 12.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Wrap(
                  spacing: 10.w,
                  runSpacing: 7.h,
                  children: _user.skills
                      .map(
                        (skill) => Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                          decoration: BoxDecoration(color: AppColors.grey200, borderRadius: BorderRadius.circular(12.r)),
                          child: Text(
                            skill,
                            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300, color: Colors.black),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),

              SizedBox(height: 32.h),

              // Retos cumplidos
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text('Retos cumplidos', style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.w600)),
              ),

              SizedBox(height: 12.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: _user.completedChallenges
                      .map(
                        (challenge) => Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(color: AppColors.grey300, shape: BoxShape.circle),
                        ),
                      )
                      .toList(),
                ),
              ),

              SizedBox(height: 80.h), // Espacio para el bottom navigation
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 210.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Imagen de fondo del header
          Container(
            height: 210.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.grey200,
              image: _user.coverImageUrl != null
                  ? DecorationImage(image: NetworkImage(_user.coverImageUrl!), fit: BoxFit.cover)
                  : null,
            ),
          ),

          // Botones de navegación
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Botón de editar
                    GestureDetector(
                      onTap: () {
                        // Acción de editar perfil
                      },
                      child: Container(
                        width: 31.w,
                        height: 29.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Color.fromARGB(128, 245, 245, 245), shape: BoxShape.circle),
                        padding: EdgeInsets.all(1.w),
                        child: IconifyIcon(icon: 'clarity:edit-line', size: 20.sp, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Avatar circular
          Positioned(
            left: 0,
            right: 0,
            bottom: -32,
            child: Center(
              child: Container(
                width: 137.w,
                height: 137.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: _user.profileImageUrl != null
                      ? DecorationImage(image: NetworkImage(_user.profileImageUrl!), fit: BoxFit.cover)
                      : null,
                  color: _user.profileImageUrl == null ? AppColors.grey300 : null,
                ),
                child: _user.profileImageUrl == null
                    ? Icon(Icons.person, size: 60.sp, color: AppColors.grey600)
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
