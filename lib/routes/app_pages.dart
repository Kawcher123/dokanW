import 'package:dokan/presentation/screens/signup/bindings/signup_binding.dart';
import 'package:dokan/presentation/screens/signup/views/signup_view.dart';
import 'package:get/get.dart';

import '../presentation/screens/acount/bindings/acount_binding.dart';
import '../presentation/screens/acount/views/acount_view.dart';
import '../presentation/screens/home/bindings/home_binding.dart';
import '../presentation/screens/home/views/home_view.dart';
import '../presentation/screens/login/bindings/login_binding.dart';
import '../presentation/screens/login/views/login_view.dart';
import '../presentation/screens/root/bindings/root_binding.dart';
import '../presentation/screens/root/views/root_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ACOUNT,
      page: () => const AcountView(),
      binding: AcountBinding(),
    ),
    GetPage(
      name: _Paths.ROOT,
      page: () => const RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
  ];
}
