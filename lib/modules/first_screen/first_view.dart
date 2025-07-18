import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_suitmedia_test/widgets/custom_button.dart';
import 'package:mobile_suitmedia_test/widgets/custom_text_field.dart';
import 'first_controller.dart';

class FirstView extends GetView<FirstController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/first_screen_background.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AddUserButton(onPressed: () {}),
                    SizedBox(height: 50),
                    CustomTextField(
                      controller: controller.nameController,
                      labelText: 'Name',
                    ),
                    const SizedBox(height: 20),

                    CustomTextField(
                      controller: controller.palindromeController,
                      labelText: 'Palindrome',
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      text: 'CHECK',
                      onPressed: () => controller.checkPalindrome(),
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'NEXT',
                      onPressed: () => controller.goToSecondScreen(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
