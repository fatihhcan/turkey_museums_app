import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/init/di/locator.dart' as servicelocator;
import 'core/init/navigation/navigation_routes.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/theme/app_theme_manager.dart';
void main() async {
  await dotenv.load(fileName: ".env");
    WidgetsFlutterBinding.ensureInitialized();

    await servicelocator.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, widget) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.instance.navigatorKey,
         onGenerateRoute: NavigationRoute.instance.generateRoute,
          theme: AppThemeManager.instance.lightTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
