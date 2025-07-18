import 'package:get/get.dart';
import 'package:mobile_suitmedia_test/modules/third_screen/third_controller.dart';

class ThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThirdController>(() => ThirdController());
  }
}
