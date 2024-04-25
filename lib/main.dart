import 'package:flutter/material.dart';
import 'package:promina_task/core/routing/routes.dart';
import 'package:promina_task/promina_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/dependency_injection/dependency_injection.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();

  String initialRoute= await isAuthenticated() ? Routes.loginRoute : Routes.loginRoute;

  runApp(ProminaApp(initialRoute: initialRoute,));
}

/// Check if the user is login before.
Future<bool> isAuthenticated()async {
  SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
  String? token= sharedPreferences.getString('token');
  if(token==null) return false;
  else return true;
}