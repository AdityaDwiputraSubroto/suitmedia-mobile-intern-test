import 'package:get/get.dart';
import '../../routes/app_route.dart';

class SecondController extends GetxController {
  final String userName;
  var selectedUserName = ''.obs;

  SecondController(this.userName);

  void setSelectedUserName(String name) {
    selectedUserName.value = name;
  }

  void goToThirdScreen() {
    Get.toNamed(
      Routes.THIRD,
      arguments: {'onUserSelected': setSelectedUserName},
    );
  }
}
