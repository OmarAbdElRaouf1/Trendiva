import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/di/service_locator.dart';
import 'package:trendiva/core/routing/app_router.dart';
import 'package:trendiva/core/routing/navigation_service.dart';
import 'package:trendiva/core/routing/routes.dart';
import 'package:trendiva/core/theme/app_theme.dart';
import 'package:trendiva/core/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const Trendiva());
}

class Trendiva extends StatelessWidget {
  const Trendiva({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>.value(
      value: sl<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return ScreenUtilPlusInit(
            designSize: const Size(360, 884),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              title: 'Trendiva',
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: themeMode,
              initialRoute: Routes.splashView,
              onGenerateRoute: AppRouter.onGenerateRoute,
            ),
          );
        },
      ),
    );
  }
}
