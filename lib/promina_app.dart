import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_task/core/dependency_injection/dependency_injection.dart';
import 'package:promina_task/src/upload_image/logic/upload_image_cubit.dart';
import 'core/routing/app_router.dart';


class ProminaApp extends StatelessWidget {
  const ProminaApp({super.key, required this.initialRoute});

  final String initialRoute;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UploadImageCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
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
      ),
    );
  }
}