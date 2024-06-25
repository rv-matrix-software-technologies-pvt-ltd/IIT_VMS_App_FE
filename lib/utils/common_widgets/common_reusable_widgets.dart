import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vms_application/utils/common_reusable_class/common_classes.dart';
import 'package:vms_application/utils/constant/sizeconfig.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/constant/styles.dart';

typedef OTPFieldChangedCallback = void Function(String value);
Widget otpTextField(RxString otp, BuildContext context, bool autoFocus, OTPFieldChangedCallback onFieldChanged) {
  return Container(
    height: getProportionateScreenHeight(45),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(5),
      color: vmsHalfWhiteColor,
      shape: BoxShape.rectangle,
    ),
    child: AspectRatio(
      aspectRatio: 0.75,
      child: TextField(
        autofocus: autoFocus,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: 10,left: 3)
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          color: vmsBlackColor,
        ),
        maxLines: 1,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        onChanged: (value) {
          otp.value = value;
          onFieldChanged(value);
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          } else {
            // loginScreenController.verifiedOTP.value = false;
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    ),
  );
}

Widget customVerticalDivider() {
  return VerticalDivider(
    color: errorCodeTextClr.withOpacity(0.40), //color of divider
    width: 10, //width space of divider
    thickness: 2, //thickness of divider line
    indent: 12, //Spacing at the top of divider.
    endIndent: 12, //Spacing at the bottom of divider.
  );
}

Widget customSizedBox(double val) {
  return SizedBox(height: getProportionateScreenHeight(val));
}

Widget customSizedBox5() {
  return SizedBox(height: getProportionateScreenHeight(5));
}

Widget customSizedBox10() {
  return SizedBox(height: getProportionateScreenHeight(10));
}

Widget customSizedBox15() {
  return SizedBox(height: getProportionateScreenHeight(15));
}

Widget customSizedBox20() {
  return SizedBox(height: getProportionateScreenHeight(20));
}

Widget customSizedBox25() {
  return SizedBox(height: getProportionateScreenHeight(25));
}

Widget customSizedBoxWithChild({double? height, Widget? child}) {
  return SizedBox(height: getProportionateScreenHeight(height!), child: child);
}

Future<dynamic> customToastMessage(String msg,
    [Color? toastTextColor, Color? toastBgColor]) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    textColor: toastTextColor,
    backgroundColor: toastBgColor,
  );
}

Future customDialogPopups(
    {context,
    Widget? icon,
    String? title,
    String? msg,
    VoidCallback? callbackOneAction,
    VoidCallback? callbackTwoAction,
    String? btnOneName,
    String? btnTwoName,
    String? dialogType}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            icon: icon,
            title: title == null
                ? null
                : Text(
                    title,
                    textAlign:
                        dialogType == null ? TextAlign.center : TextAlign.left,
                    style: commonStyleModify(
                        fontsize: 18,
                        fontweight: FontWeight.w400,
                        textColor: colorBlack),
                  ),
            content: msg == null
                ? null
                : Text(
                    msg,
                    textAlign:
                        dialogType == null ? TextAlign.center : TextAlign.left,
                    style: commonStyleModify(
                        fontsize: 16,
                        fontweight: FontWeight.w400,
                        textColor: colorBlack),
                  ),
            actionsAlignment: dialogType == null
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            actionsOverflowButtonSpacing: 8.0,
            actions: [
              Padding(
                padding: dialogType == null
                    ? EdgeInsets.zero
                    : const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextButton(
                  onPressed: callbackOneAction,
                  style: dialogType == null
                      ? alertWindowButtonStyle()
                      : alertWindowWithUserActionBgButtonStyle(),
                  child: Text(
                    btnOneName!,
                    style: commonStyleModify(
                        fontsize: 14,
                        fontweight: FontWeight.w400,
                        textColor: colorBlack),
                  ),
                ),
              ),
              dialogType == null
                  ? TextButton(
                      style: alertWindowWithUserActionBgButtonStyle(),
                      onPressed: callbackTwoAction,
                      child: Text(
                        btnTwoName!,
                        style: commonStyleModify(
                            fontsize: 14,
                            fontweight: FontWeight.w400,
                            textColor: vmsWhiteColor),
                      ),
                    )
                  : TextButton(
                      onPressed: () => Get.back(),
                      child: Text(
                        btnTwoName!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: readexFontFamily,
                          fontWeight: FontWeight.w400,
                          shadows: [
                            Shadow(color: colorBlack, offset: Offset(0, -5))
                          ],
                          color: Colors.transparent,
                          decoration: TextDecoration.underline,
                          decorationColor: vmsOrangeColor,
                          decorationThickness: 2,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                    )
            ],
          ));
}

Future confirmationDialogPopups(
    {context,
    Widget? icon,
    String? title,
    String? msg,
    VoidCallback? callbackTwoAction,
    String? btnTwoName}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            icon: icon,
            title: title == null
                ? null
                : Text(
                    title,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: commonStyleModify(
                      fontweight: FontWeight.w400,
                      fontsize: 14,
                      textColor: colorBlack,
                    ),
                  ),
            content: msg == null
                ? null
                : Text(
                    msg,
                    textAlign: TextAlign.center,
                    style: commonStyleModify(
                        fontsize: 18,
                        fontweight: FontWeight.w500,
                        textColor: colorBlack),
                  ),
            actionsAlignment: MainAxisAlignment.center,
            actionsOverflowButtonSpacing: 8.0,
            actions: [
              TextButton(
                style: alertWindowWithBgButtonStyle(),
                onPressed: callbackTwoAction,
                child: Text(
                  btnTwoName!,
                  style: commonStyleModify(
                      fontsize: 13,
                      fontweight: FontWeight.w400,
                      textColor: vmsWhiteColor),
                ),
              ),
            ],
          ));
}

Widget feedsCommonUI() {
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: 4,
    itemBuilder: (context, index) {
      return Card(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                  offset: Offset(1.0, 1.0),
                )
              ],
              gradient: LinearGradient(
                colors: [
                  vmsGreyColor.withOpacity(0.2),
                  vmsGreyColor.withOpacity(0.2),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Center(
                    child: Image.asset(
                      mockFeedsImg,
                      height: getProportionateScreenHeight(300),
                      width: getProportionateScreenWidth(300),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                customSizedBox15(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2.0, horizontal: 20),
                  child: Text(
                    'Sep 03 2023',
                    style: commonStyleModify(
                        fontweight: FontWeight.w400,
                        textColor: vmsOrangeColor,
                        fontsize: 18),
                  ),
                ),
                customSizedBox5(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Text(
                    'Enjoy your cup of coffee - Introducing our Private Cabin in WorkEZ Urban Square, a space for your privacy, meeting and play-full work-area ',
                    style: TextStyle(color: vmsGreyColor),
                  ),
                ),
                customSizedBox10(),
              ],
            ),
          ));
    },
  );
}

Widget commonTextField(
    {String? hintText,
    RxBool? errorBool,
    String? errorText,
    void Function(String)? onChangedPressed,
    TextEditingController? textEditingController,
    bool? isNumber = false,
    bool? isFloorNo = false}) {
  return Obx(
    () => Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.transparent, // Set your desired background color here
          ),
          child: TextField(
            controller: textEditingController,
            onChanged: onChangedPressed,
            style: const TextStyle(
              fontFamily: readexFontFamily,
              fontWeight: FontWeight.w400,
              color: vmsBlackColor,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: vmsHalfWhiteColor,
              hintText: hintText,
              labelStyle: const TextStyle(
                // color: Color(0xFF95A1AC),
                color: vmsGreyColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              hintStyle: const TextStyle(
                // color: Color(0xFF95A1AC),
                color: vmsGreyColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  // color: Color(0xFFDBE2E7),
                  // color: workEZCardBgColor,
                  color: vmsHalfWhiteColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  // color: Color(0xFFDBE2E7),
                  // color: workEZCardBgColor,
                  color: vmsHalfWhiteColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  // color: Color(0xFFDBE2E7),
                  // color: workEZCardBgColor,
                  color: vmsHalfWhiteColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              // filled: true,
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 8, horizontal: 16), // Adjust height here
            ),
            inputFormatters: isNumber! ? isFloorNo! ? [LengthLimitingTextInputFormatter(2),NumberTextInputFormatter()] : [NumberTextInputFormatter()] : [],
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          ),
        ),
        customSizedBox10(),
        Align(
          alignment: Alignment.bottomRight,
          child: Visibility(
            visible: errorBool!.value != true,
            child: Text(
              errorText!,
              style: commonStyleModify(
                fontsize: 14,
                fontweight: FontWeight.w400,
                textColor: colorRed,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget commonElevatedButton(
    {String? buttonName, void Function()? onPressedFunction, bool isEnabled = false,}) {
  return ElevatedButton(
    onPressed: isEnabled ? onPressedFunction : null,
    style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightGreen,
        textStyle: commonTextStyle18(),
        minimumSize: const Size.fromHeight(25),
        shape: const StadiumBorder()),
    child: Text(
      buttonName!,
      style: commonStyleModify(
          fontweight: FontWeight.w400,
          textColor: vmsCardBgColor,
          fontsize: 15),
    ),
  );
}

Future commonGetConfirmationDialog({String? screenLoadedFrom, String? viewScreen}) {
  return Get.defaultDialog(
      // title: "Something Went Wrong",
    barrierDismissible: true,
      content: Text(
        viewScreen == null
            ? "User not found\n\nWould you like to create a account"
            : "User not found\n\nWould you like to create a account",
        style: commonStyleModify(
            fontsize: 16, fontweight: FontWeight.w400, textColor: colorBlack),
        textAlign: TextAlign.center,
      ),
      confirm: ElevatedButton(
          style: alertWindowWithUserActionBgButtonStyle(),
          onPressed: () {
            // TODO - move the user to registration screen
            Get.back();
          },
          child: Text(
            'Create User',
            style: commonStyleModify(
                fontsize: 14,
                fontweight: FontWeight.w400,
                textColor: vmsWhiteColor),
          )));
}


Future commonGetDialog({required String contentText,required String confirmButtonName,required String cancelButtonName,required String titleText, void Function()? onPressedFunction,void Function()? onPressedCancelFunction}) {
  return Get.defaultDialog(
      title: titleText,
      titleStyle: const TextStyle(
        fontFamily: readexFontFamily,
          fontSize: 18, fontWeight: FontWeight.w600, color: vmsBlackColor),
      barrierDismissible: true,
      content: Text(contentText,
        style: commonStyleModify(
            fontsize: 14, fontweight: FontWeight.w500, textColor: vmsBlackColor),
        textAlign: TextAlign.center,
      ),
      confirm: ElevatedButton(
          style: alertWindowWithUserActionBgButtonStyle(),
          onPressed: onPressedFunction,
          child: Text(
            confirmButtonName,
            style: commonStyleModify(
                fontsize: 14,
                fontweight: FontWeight.w400,
                textColor: vmsWhiteColor),
          )),
      cancel: TextButton(
          style: alertWindowBtnNoBgButtonStyle(),
          onPressed: onPressedCancelFunction,
          child: Text(
            cancelButtonName,
            style: commonStyleModify(
                fontsize: 14,
                fontweight: FontWeight.w400,
                textColor: vmsBlackColor),
          )),);
}

typedef FilterCallback = void Function(List<dynamic>);

Future<void> requestCameraPermissions(
    {String? successToast, String? failureToast}) async {
  debugPrint("Requesting Camera Permission");
  // Request Storage permission
  dynamic cameraPermissionStatus;
  final storage = GetStorage();

  if (Platform.isAndroid) {
    cameraPermissionStatus = await Permission.camera.request();
  } else if (Platform.isIOS) {
    cameraPermissionStatus = await Permission.camera.request();
  }

  if (cameraPermissionStatus != PermissionStatus.granted) {
    // Handle location permission denied
    debugPrint("Failed To Get Camera Permission");
  }

// You can can also directly ask the permission about its status.
  if (await Permission.camera.isRestricted) {
    // The OS restricts access, for example because of parental controls.
    return;
  }

  // Request Storage permission
  final storagePathPermissionStatus = await Permission.camera.request();
  if (storagePathPermissionStatus != PermissionStatus.granted) {
    final secondPermissionStatus = await Permission.camera.request();
    if (secondPermissionStatus == PermissionStatus.granted) {
      storage.write('cameraPermissionRequested', true);
      Get.back();
    } else {
      // Wi-Fi permission still denied
      customToastMessage(failureToast!);
      // customToastMessage("Please enable wifi permission to connect device");
      if (storagePathPermissionStatus == secondPermissionStatus) {
        Future.delayed(const Duration(seconds: 2))
            .then((value) => openAppSettings());
      }
    }
  } else {
    // Wi-Fi permission already granted
    // status = PermissionStatus.granted as bool?;
    storage.write('cameraPermissionRequested', true);
    customToastMessage(successToast!);
    // today commenting this back function code and checking
    // Get.back();
  }
}

Widget commonBodyHeadingText(String textName) {
  return Text(
    textName,
    style: commonStyleModify(
        fontweight: FontWeight.bold, textColor: vmsBlackColor, fontsize: 14),
  );
}



