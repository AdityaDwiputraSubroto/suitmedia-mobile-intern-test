import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_suitmedia_test/widgets/custom_button.dart';
import 'first_controller.dart';

class FirstView extends GetView<FirstController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller.palindromeController,
                    decoration: const InputDecoration(
                      labelText: 'Palindrome',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: 'CHECK',
                    onPressed: () => controller.checkPalindrome(),
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    text: 'NEXT',
                    onPressed: () => controller.goToSecondScreen(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
