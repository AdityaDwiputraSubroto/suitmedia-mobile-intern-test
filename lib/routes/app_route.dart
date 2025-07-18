import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/first_screen/first_binding.dart';
import '../modules/first_screen/first_view.dart';
import '../modules/second_screen/second_binding.dart';
import '../modules/second_screen/second_view.dart';
import '../modules/third_screen/third_binding.dart';
import '../modules/third_screen/third_view.dart';

abstract class Routes {
  static const FIRST = '/';
  static const SECOND = '/second';
  static const THIRD = '/third';
}

class AppRoute {
  static const initial = Routes.FIRST;

  static final routes = [
    GetPage(
      name: Routes.FIRST,
      page: () => FirstView(),
      binding: FirstBinding(),
    ),
    GetPage(
      name: Routes.SECOND,
      page: () => SecondView(),
      binding: SecondBinding(),
    ),
    GetPage(
      name: Routes.THIRD,
      page: () => ThirdView(),
      binding: ThirdBinding(),
    ),
  ];
}
