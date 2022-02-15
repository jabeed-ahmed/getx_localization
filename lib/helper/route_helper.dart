import 'package:get/get.dart';
import 'package:getx_localization/view/screens/language/language_screen.dart';
import 'package:getx_localization/view/screens/splash/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String language = '/language';
  static String getSplashRoute() => splash;

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: language,
      page: () => const ChooseLanguageScreen(),
    )
  ];
}
