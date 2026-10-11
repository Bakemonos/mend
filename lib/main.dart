import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mend/core/routing/router.dart';
import 'package:mend/core/theme/theme.dart';
import 'package:mend/shared/controllers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [sharedPrefsProvider.overrideWithValue(prefs)],
    child: const MendApp(),
  ));
}

class MendApp extends ConsumerWidget {
  const MendApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
 
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: MyTheme.lightTheme(),
          darkTheme: MyTheme.darkTheme(),
          themeAnimationDuration: Duration.zero,
          themeMode: themeMode,
          routerConfig: routes,
        );
      },
    );
  }
}
