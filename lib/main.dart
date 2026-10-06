import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mend/core/routing/router.dart';
import 'package:mend/core/theme/theme.dart';
import 'package:mend/shared/controllers/toggler_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);
    final themeMode = isDark ? ThemeMode.dark : ThemeMode.light;

    return ScreenUtilInit(
      designSize: Size(1280, 800),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: themeMode,
        theme: MyTheme.lightTheme(),
        // darkTheme: MyTheme.darkTheme(),
        themeAnimationDuration: Duration.zero,
        routerConfig: routes,
      ),
    );
  }
}
