import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'theme/app_theme.dart';
import 'routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(393, 852),
      builder: (context, child) => MaterialApp.router(
        title: 'Zaia Ink la ech',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme, // Descomenta cuando implementes el tema oscuro
        routerConfig: AppRouter.router,
      ),
    );
  }
}
