import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';


class ProminaApp extends StatelessWidget {
  const ProminaApp({super.key, required this.initialRoute});
  final String initialRoute;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: initialRoute,
          onGenerateRoute: AppRouter.onGeneratedRoute,
          title: 'Promina',
          home: child,
        );
      },
      // child: RegisterScreen(),
    );
  }
}