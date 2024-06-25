import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_application/controllers/loginscreen_controller/loginscreen_controller.dart';
import 'package:vms_application/utils/common_loader_controller/common_loader.dart';
import 'package:vms_application/utils/common_widgets/common_loader.dart';
import 'package:vms_application/utils/common_widgets/common_reusable_widgets.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/constant/styles.dart';

class PasswordResetView extends StatefulWidget {
  const PasswordResetView({Key? key}) : super(key: key);

  @override
  State<PasswordResetView> createState() => _PasswordResetViewState();
}

class _PasswordResetViewState extends State<PasswordResetView> {
  final LoginScreenController loginScreenController =
  Get.put(LoginScreenController());
  final CommonLoaderController commonLoaderController =
  Get.put(CommonLoaderController());

  bool isEmailEmpty = true;
  bool isPasswordEmpty = true;

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: iitBgThemeColor,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xffEBF8EE),
                      radius: 35,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          iitLogo,
                          scale: 4,
                        ),
                      ),
                    ),
                    customSizedBox(50),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Text(
                        "Enter your email id",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    customSizedBox20(),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 32),
                      child: const Text(
                        "We will send you a verification code to reset your password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff979899)),
                      ),
                    ),
                    customSizedBox25(),
                    Column(
                      children: [
                        commonTextField(
                          hintText: emailHintText,
                          errorBool: loginScreenController.isValidEmail,
                          errorText: emailErrorText,
                          onChangedPressed: (String value) {
                            setState(() {
                              loginScreenController.setEmail(value);
                              isEmailEmpty = value.isEmpty; // Update the flag based on email field content
                            });
                          },
                          textEditingController:
                          loginScreenController.emailTextController,
                        ),
                        customSizedBox10(),
                        commonTextField(
                          hintText: verificationHintText,
                          errorBool: loginScreenController.isVerifyPassword,
                          errorText: passwordErrorText,
                          onChangedPressed: (String value) {
                            setState(() {
                              loginScreenController.setPassword(value);
                              isPasswordEmpty = value.isEmpty; // Update the flag based on email field content
                            });
                          },
                          textEditingController:
                          loginScreenController.passwordTextController,
                          isNumber: true
                        ),
                        Obx(() {
                            if (loginScreenController.isClicked.value) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: FractionallySizedBox(
                                  widthFactor: 0.6,
                                  child: ElevatedButton(
                                    style: alertWindowWithUserActionBgButtonStyle(),
                                    onPressed: ((!isPasswordEmpty && loginScreenController.isValidPassword
                                        .value) &&
                                        (!isEmailEmpty &&
                                            loginScreenController.isValidEmail
                                                .value)) ?  () => loginScreenController.checkUserValidation(context) : () {
                                      isEmailEmpty ? customToastMessage("Please provide valid email id")
                                          : isPasswordEmpty ? customToastMessage("Please provide password") :
                                      commonGetConfirmationDialog();
                                    },
                                    child: Text(
                                      verifyText,
                                      style: commonStyleModify(
                                          fontweight: FontWeight.w400,
                                          textColor: vmsWhiteColor,
                                          fontsize: 15),
                                    ),
                                  ),
                                ),
                              );
                            }
                            else {
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
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32,vertical: 20.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text:
                      "By clicking on “Login” you are agreeing to our\n",
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
