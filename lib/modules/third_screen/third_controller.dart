import 'package:get/get.dart';
import '../../models/user_model.dart';
import '../../services/api_service.dart';

class ThirdController extends GetxController {
  var users = <User>[].obs;
  var isLoading = false.obs;
  var isRefreshing = false.obs;
  var isLastPage = false.obs;
  var page = 1;
  final int perPage = 10;

  late final Function(String) onUserSelected;

  @override
  void onInit() {
    super.onInit();
    onUserSelected = Get.arguments['onUserSelected'];
    fetchUsers();
  }

  Future<void> fetchUsers({bool refresh = false}) async {
    if (isLoading.value || isLastPage.value) return;

    if (refresh) {
      isRefreshing.value = true;
      page = 1;
      isLastPage.value = false;
    } else {
      isLoading.value = true;
    }

    try {
      final List<User> fetchedUsers = await ApiService.fetchUsers(
        page: page,
        perPage: perPage,
      );

      if (refresh) {
        users.assignAll(fetchedUsers);
      } else {
        users.addAll(fetchedUsers);
      }

      if (fetchedUsers.length < perPage) {
        isLastPage.value = true;
      } else {
        page++;
      }
    } catch (e) {
      print('Error fetching users: $e');
    } finally {
      isLoading.value = false;
      isRefreshing.value = false;
    }
  }

  void selectUser(User user) {
    final fullName = '${user.firstName} ${user.lastName}';
    onUserSelected(fullName);
    Get.back();
  }
}
