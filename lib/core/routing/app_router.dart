import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_task/core/routing/routes.dart';
import 'package:promina_task/src/gallery/logic/gallery_cubit.dart';
import 'package:promina_task/src/gallery/ui/screens/image_details_screen.dart';
import 'package:promina_task/src/upload_image/logic/upload_image_cubit.dart';
import '../../src/gallery/ui/screens/gallery_screen.dart';
import '../../src/login/logic/login_cubit.dart';
import '../../src/login/ui/login_screen.dart';
import '../../src/upload_image/ui/screens/upload_image_screen.dart';
import '../dependency_injection/dependency_injection.dart';


class AppRouter {
  static Route<dynamic>? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => getIt<GalleryCubit>(),
              child: const HomeScreen(),
            ));

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (_) => getIt<LoginCubit>(),
              child: LoginScreen(),
            ));

      case Routes.uploadImageRoute:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => getIt<UploadImageCubit>(),
              child: UploadImageScreen(
                homeContext: routeSettings.arguments as BuildContext,),
            ));

      case Routes.imageDetailsScreen:
        return MaterialPageRoute(builder: (context) =>
            ImageDetailsScreen(image: routeSettings.arguments as String));

      default:
        return undefinedRoute();
    }
  }


  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(builder: (context) =>
    const Scaffold(
      body: Scaffold(
          body: Center(child: Text('No page founded'))),
    ));
  }
}