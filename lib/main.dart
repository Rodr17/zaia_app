import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'theme/app_theme.dart';
import 'routes/app_router.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        title: 'Zaia Ink la ech',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,
        routerConfig: AppRouter.router,
        supportedLocales: const [Locale('en', 'US'), Locale('es', 'MX')],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        builder: (context, widget) {
          /// No cambia el tamaño de texto según la configuración del sistema
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
            child: widget ?? const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
