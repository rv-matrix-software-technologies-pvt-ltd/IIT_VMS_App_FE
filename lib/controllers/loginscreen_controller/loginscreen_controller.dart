import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vms_application/utils/common_reusable_class/common_classes.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/constant/urls.dart';
import 'package:vms_application/utils/networkcalls/network_calls.dart';

class LoginScreenController extends GetxController {
  //region // member variables
  final countdown = 120.obs;
  Timer? timer;
  RxBool isClicked = true.obs;
  final email = ''.obs;
  final password = ''.obs;
  final verificationCode = ''.obs;
  final isValidEmail = true.obs;
  final isValidPassword = true.obs;
  final isVerifyPassword = true.obs;
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  //endregion

  void setEmail(String value) {
    email.value = value;
    isValidEmail.value = EmailValidator.isValid(value);
  }

  void setPassword(String value) {
    if (value.length >= 8) {
      password.value = value;
      isValidPassword.value = true;
    }
    else {
      isValidPassword.value = false;
    }
  }

  void checkUserValidation(BuildContext context) async {
    // commonLoaderController.showFullScreenLoader();
    isClicked.value = false;
    String emailId = email.value;
    String pswrd = password.value;
    final storage = GetStorage();
    Map<String, String> data = {
      "emailId":emailId,
      "password":pswrd
    };
    var jsonResponse = await httpPostMethodApiCall(url: loginUrl, data: data);
    if (jsonResponse['success'] == true) {
      isClicked.value = true;
      Get.offAndToNamed(homeRoute);
    }
    else {
      if (jsonResponse["userAvailable"] == 1) {
        isClicked.value = true;
        storage.write(isUser, valueTrue);
        Get.toNamed(userTypeRoute);
      }
      else {
        Get.toNamed(securityUserRoute);
        isClicked.value = true;
      }
    }
  }

  checkVerifyValidation() async {
    isClicked.value = false;
    String emailId = email.value;
    String verifyCode = verificationCode.value;
    final storage = GetStorage();
    Map<String, String> data = {
      "emailId":emailId,
      "verificationCode":verifyCode
    };
  }
}