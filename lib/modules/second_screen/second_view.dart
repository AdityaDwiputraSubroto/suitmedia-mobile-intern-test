import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import 'second_controller.dart';

class SecondView extends GetView<SecondController> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double topPadding = MediaQuery.of(context).padding.top;
    const double appBarHeight = kToolbarHeight;
    return Scaffold(
      appBar: CustomAppBar(title: 'Second Screen'),
      body: Stack(
        children: [
          Positioned(
            top: 24,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Welcome', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 2),
                Text(
                  controller.userName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: (screenHeight - topPadding - appBarHeight) / 2 - 24,
            left: 0,
            right: 0,
            child: Center(
              child: Obx(
                () => Text(
                  controller.selectedUserName.value.isEmpty
                      ? 'Selected User Name'
                      : controller.selectedUserName.value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: CustomButton(
              text: 'Choose a User',
              onPressed: () => controller.goToThirdScreen(),
            ),
          ),
        ],
      ),
    );
  }
}
