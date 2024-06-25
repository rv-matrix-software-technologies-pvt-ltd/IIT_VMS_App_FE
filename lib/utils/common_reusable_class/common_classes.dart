import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:vms_application/utils/constant/sizeconfig.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/constant/styles.dart';

class EmailValidator {
  static bool isValid(String email) {
    // Regular expression for a valid email address
    final RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return regex.hasMatch(email);
  }
}

class SuccessDialog extends StatelessWidget {
  final String message;
  final String route;

  const SuccessDialog({super.key, required this.message, required this.route});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 35,
          ),
          SizedBox(height: getProportionateScreenHeight(16)),
          Text(
            message,
            textAlign: TextAlign.center,
            style: commonStyleModify(
                fontweight: FontWeight.w500,
                fontsize: 18,
                textColor: colorBlack),
          ),
          SizedBox(height: getProportionateScreenHeight(16)),
          ElevatedButton(
            onPressed: () => Get.offAndToNamed(route),
            style: alertWindowWithUserActionBgButtonStyle(),
            child: Text(
              buttonDoneText,
              style: commonStyleModify(
                  textColor: vmsWhiteColor,
                  fontsize: 15,
                  fontweight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text
        .replaceAll(RegExp(r'\D'), ''); // Remove non-numeric characters
    const maxLength = 16; // Maximum length

    if (newText.length > maxLength) {
      // Truncate the text if it exceeds the maximum length
      final truncatedText = newText.substring(0, maxLength);
      return TextEditingValue(
        text: truncatedText,
        selection: TextSelection.collapsed(offset: truncatedText.length),
      );
    }

    return TextEditingValue(
      text: newText,
      selection: newValue.selection,
    );
  }
}

class CommonCategoryCard extends StatelessWidget {
  const CommonCategoryCard({
    super.key,
    this.categoryName = 'Category Name',
  });
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffeeeeee), width: 2.0),
        color: Colors.white38,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        boxShadow: const [
          BoxShadow(
            color: Colors.white10,
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.all(8),
      height: getProportionateScreenHeight(135),
      width: getProportionateScreenWidth(125),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/icons/organic_icon.png",
            height: getProportionateScreenHeight(110),
            width: getProportionateScreenWidth(110),
          )),
          Text(
            categoryName,
            style: const TextStyle(
                fontFamily: 'Roboto',
                // fontFamily: 'Rubik',
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: vmsGreyColor),
          ),
        ],
      ),
    );
  }
}
