import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_route.dart';

class FirstController extends GetxController {
  final nameController = TextEditingController();
  final palindromeController = TextEditingController();

  bool isPalindrome(String input) {
    final cleaned = input.replaceAll(RegExp(r'[^a-z0-9]'), '').toLowerCase();
    print("Input: ${input}");
    print("Cleaned: ${cleaned}");
    return cleaned == cleaned.split('').reversed.join();
  }

  void checkPalindrome() {
    final input = palindromeController.text;
    if (input.isEmpty) {
      Get.snackbar('Sorry', 'Please Palindrome Text');
      return;
    }
    final result = isPalindrome(input);
    Get.defaultDialog(
      title: 'Palindrome Check',
      middleText: result ? 'isPalindrome' : 'not palindrome',
      textConfirm: 'OK',
      onConfirm: Get.back,
      buttonColor: const Color(0xFF2B637B),
      backgroundColor: Colors.white,
    );
  }

  void goToSecondScreen() {
    final name = nameController.text.trim();
    if (name.isEmpty) {
      Get.snackbar(
        'Sorry',
        'Please enter your name',
        backgroundColor: Colors.white,
      );
      return;
    }
    Get.toNamed(Routes.SECOND, arguments: {'name': name});
  }
}
