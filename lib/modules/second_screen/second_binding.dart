import 'package:get/get.dart';
import 'second_controller.dart';

class SecondBinding extends Bindings {
  @override
  void dependencies() {
    final args = Get.arguments as Map<String, dynamic>;
    final name = args['name'] ?? 'No Name';

    Get.lazyPut<SecondController>(() => SecondController(name));
  }
}
