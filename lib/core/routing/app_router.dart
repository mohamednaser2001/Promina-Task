import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_task/core/routing/routes.dart';
import 'package:promina_task/src/gallery/logic/gallery_cubit.dart';
import '../../src/gallery/ui/screens/gallery_screen.dart';
import '../../src/login/logic/login_cubit.dart';
import '../../src/login/ui/login_screen.dart';
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