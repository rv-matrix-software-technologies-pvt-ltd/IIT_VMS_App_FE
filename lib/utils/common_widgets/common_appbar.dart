import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vms_application/utils/constant/sizeconfig.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/constant/styles.dart';

AppBar commonAppbar(
    {String? titleText,
    String? screenName}) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      systemNavigationBarColor: vmsCardBgColor, // Navigation bar
      statusBarColor: iitBgThemeColor, // Status bar
    ),
    backgroundColor: iitBgThemeColor,
      title: Text(titleText ?? "",
      style: commonTextStyle18(),),
    automaticallyImplyLeading: false,
    elevation: 0.0,
    actions: screenName == loginText
        ? [
            Visibility(
              visible: false,
              child: IconButton(
                onPressed: () {
                  // Get.to(() => const CommonEnquiryView());
                },
                icon: Image.asset(
                  notificationWhiteIcon,
                  height: getProportionateScreenHeight(25),
                  width: getProportionateScreenWidth(25),
                ),
              ),
            ),
            // customSizedBox5()
          ]
        : [],
  );
}
