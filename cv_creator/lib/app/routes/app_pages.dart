import 'package:cv_creator/app/modules/home/views/common_view.dart';
import 'package:cv_creator/app/modules/home/views/edit_profile.dart';
import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/experience_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.EditProfile;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const ExperienceView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COM,
      page: () => const CommonView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EDIT,
      page: () => const EditProfile(),
      binding: HomeBinding(),
    ),
  ];
}
