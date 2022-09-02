import '../main.dart';
import '../screens/home_screen.dart';
import '../screens/registration.dart';

const String SplashRoute = "/splash";
const String HomeRoute = "/home";
const String LoginRoute = "/login";

final routes = {
  SplashRoute: (context) =>  MySplash(),
  HomeRoute: (context) =>  HomeScreen(),
  LoginRoute: (context) =>  RegScreen()
};