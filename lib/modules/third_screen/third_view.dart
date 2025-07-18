import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_suitmedia_test/widgets/custom_appbar.dart';
import '../../models/user_model.dart';
import 'third_controller.dart';
import '../../widgets/user_tile.dart';

class ThirdView extends GetView<ThirdController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Third Screen'),
      body: Obx(() {
        if (controller.isLoading.value && controller.users.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 12),
                Text('Loading users...', style: TextStyle(color: Colors.grey)),
              ],
            ),
          );
        }

        if (controller.users.isEmpty) {
          return const Center(child: Text('No users found'));
        }

        return RefreshIndicator(
          onRefresh: () async => controller.fetchUsers(refresh: true),
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!controller.isLoading.value &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                controller.fetchUsers();
              }
              return false;
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount:
                  controller.users.length +
                  (controller.isLastPage.value ? 0 : 1),
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                if (index == controller.users.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final User user = controller.users[index];
                return UserTile(
                  user: user,
                  onTap: () => controller.selectUser(user),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
