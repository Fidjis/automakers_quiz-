import 'package:get/get.dart';

import 'presentation/pages/home_page/home_page_controller.dart';

initializerDependencys() {
  Get.lazyPut(() => HomePageController());
}
