import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_application/controllers/loginscreen_controller/loginscreen_controller.dart';
import 'package:vms_application/utils/common_loader_controller/common_loader.dart';
import 'package:vms_application/utils/common_widgets/common_appbar.dart';
import 'package:vms_application/utils/common_widgets/common_loader.dart';
import 'package:vms_application/utils/common_widgets/common_reusable_widgets.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/constant/styles.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginScreenController loginScreenController =
      Get.put(LoginScreenController());
  final CommonLoaderController commonLoaderController =
      Get.put(CommonLoaderController());

  bool isEmailEmpty = true;
  bool isPasswordEmpty = true;
  bool checkValue = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    loginScreenController.emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: iitBgThemeColor,
      appBar: commonAppbar(titleText: ""),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: const Color(0xffEBF8EE),
                        radius: 40,
                        child: Image.asset(
                          iitLogo,
                          // scale: 10,
                        ),
                      ),
                    ),
                    customSizedBox(50),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Text(
                        "Welcome to IIT Madras",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    customSizedBox5(),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text(
                        "Visitor Management System",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff979899)),
                      ),
                    ),
                    customSizedBox(50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: loginScreenController.isClicked.value,
                          replacement: Center(child: Text("Welcome, ${loginScreenController.emailTextController.text}",
                            style: commonTextStyle14Black(),
                          )),
                          child: commonTextField(
                            hintText: emailHintText,
                            errorBool: loginScreenController.isValidEmail,
                            errorText: emailErrorText,
                            onChangedPressed: (String value) {
                              setState(() {
                                loginScreenController.setEmail(value);
                                isEmailEmpty = value
                                    .isEmpty; // Update the flag based on email field content
                              });
                            },
                            textEditingController:
                                loginScreenController.emailTextController,
                          ),
                        ),
                        customSizedBox10(),
                        Visibility(
                          visible: !loginScreenController.isClicked.value,
                          child: Column(
                            children: [
                              commonTextField(
                                hintText: passwordHintText,
                                errorBool: loginScreenController.isValidPassword,
                                errorText: passwordErrorText,
                                onChangedPressed: (String value) {
                                  setState(() {
                                    loginScreenController.setPassword(value);
                                    isPasswordEmpty = value
                                        .isEmpty; // Update the flag based on email field content
                                  });
                                },
                                textEditingController:
                                    loginScreenController.passwordTextController,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () => Get.toNamed(passwordResetRoute),
                                    child: const Text('Forgot Password')),
                              ),
                            ],
                          ),
                        ),
                        customSizedBox15(),
                        Obx(
                          () {
                            if (loginScreenController.isClicked.value) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: FractionallySizedBox(
                                  widthFactor: 0.6,
                                  child: ElevatedButton(
                                    style:
                                        alertWindowWithUserActionBgButtonStyle(),
                                    onPressed: (!isEmailEmpty &&
                                                loginScreenController
                                                    .isValidEmail.value)
                                        ? () => commonGetDialog(
                                        contentText: "kindly confirm which flow to be loaded",
                                        confirmButtonName: "User",
                                        cancelButtonName: "Security",
                                        titleText: "Application Login",
                                        onPressedFunction: () async {
                                          loginScreenController.emailTextController.clear();
                                          Get.toNamed(userTypeRoute);
                                        },
                                        onPressedCancelFunction: () {
                                          loginScreenController.emailTextController.clear();
                                          Get.toNamed(securityUserRoute);
                                        })
                                        : () {
                                            isEmailEmpty
                                                ? customToastMessage(
                                                    "Please provide valid email id")
                                                : isPasswordEmpty
                                                    ? customToastMessage(
                                                        "Please provide password")
                                                    : commonGetConfirmationDialog();
                                          },
                                    child: Text(
                                      nextText,
                                      style: commonStyleModify(
                                          fontweight: FontWeight.w400,
                                          textColor: vmsWhiteColor,
                                          fontsize: 15),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: customCircularLoader(),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    customSizedBox25(),
                    Visibility(
                      visible: false,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Center(
                          child: TextButton(
                            onPressed: () => Get.offAndToNamed(homeRoute),
                            child: const Text(
                              textSkipNow,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: vmsBlackColor,
                                decoration: TextDecoration.underline,
                                decorationColor: vmsWhiteColor,
                                decorationThickness: 1.5,
                                decorationStyle: TextDecorationStyle.solid,
                                // fontFamily: readexFontFamily
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 20.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: "By clicking on “Login” you are agreeing to our\n",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xffA9A9AA),
                          fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(
                            text: "terms of use",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff5D5FEF))),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
