import 'package:flutter/material.dart';
import 'package:vms_application/utils/constant/sizeconfig.dart';

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const bodyTextStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 25, color: textColorBlue);

const bodyLabelTextStyle =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 17, color: Colors.black);

const commonTabBarHeadingStyle =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
// box shadow for all the card and container widgets
BoxShadow customGridBoxShadow() {
  return BoxShadow(
      color: Colors.black.withOpacity(0.12),
      blurRadius: 20.0,
      spreadRadius: 2,
      offset: const Offset(
        -8,
        25,
      ) //New
      );
}

BoxShadow customBoxShadow() {
  return BoxShadow(
      color: Colors.black.withOpacity(0.15),
      blurRadius: 15.0,
      spreadRadius: 10,
      offset: const Offset(
        -8,
        25,
      ) //New
      );
}

ButtonStyle alertWindowButtonStyle() {
  return  ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: colorBlack)
        )
    ),
  );
}

ButtonStyle alertWindowWithBgButtonStyle() {
  return  ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: const BorderSide(color: vmsOrangeColor)
          )
      ),
      backgroundColor: MaterialStateProperty.all(vmsOrangeColor)
  );
}

ButtonStyle alertWindowWithUserActionBgButtonStyle() {
  return  ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(color: vmsCardBgColor)
          )
      ),
      backgroundColor: MaterialStateProperty.all(vmsCardBgColor)
  );
}


ButtonStyle natureButtonStyle(){
      return TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        textStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500,
            color: vmsWhiteColor),
        shape: const StadiumBorder(),
        backgroundColor: const Color(0xff23AA49),
      );
}


ButtonStyle alertWindowBtnNoBgButtonStyle() {
  return  ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: const BorderSide(color: Colors.transparent)
          )
      ),
      textStyle: MaterialStateProperty.all(const TextStyle(
          color: colorBlack
      )),
      backgroundColor: MaterialStateProperty.all(Colors.transparent)
  );
}

// active state button properties
ButtonStyle alertWindowButtonStyleRectangle({bool? buttonSelected = false}) {
  return ButtonStyle(
    shape: MaterialStateProperty.all<OutlinedBorder>(
        StadiumBorder(side: BorderSide(color: buttonSelected! ? Colors.transparent : Colors.transparent))
    ),
    backgroundColor: MaterialStateProperty.all(buttonSelected ? Colors.transparent : Colors.transparent),
  );
}


ButtonStyle customButtonStyle() {
  return ElevatedButton.styleFrom(
    // backgroundColor: const Color(0xffC12426),
    backgroundColor: vmsOrangeColor,
    shape: const StadiumBorder(),
  );
}

TextStyle commonStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: colorBlack
);

TextStyle commonStyleModify({double? fontsize,FontWeight? fontweight,Color? textColor}) {
  return TextStyle(
    // fontFamily: 'Roboto',
    fontSize: fontsize,
      fontWeight: fontweight,
      color: textColor ?? colorBlack,
  );
}

TextStyle commonTextStyle16() {
  return const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: colorBlack,
    fontFamily: readexFontFamily,
  );
}
TextStyle commonTextStyle14Orange() {
  return const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: vmsOrangeColor,
    fontFamily: readexFontFamily,
  );
}

TextStyle commonTextStyle16Orange() {
  return const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: vmsOrangeColor,
    fontFamily: readexFontFamily,
  );
}

TextStyle commonTextStyle14Black() {
  return const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: colorBlack,
    fontFamily: readexFontFamily,
  );
}


TextStyle commonTextStyle18() {
  return const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: vmsBlackColor,
    fontFamily: readexFontFamily
    // fontFamily: 'Roboto',
  );
}

TextStyle commonTextStyleWithColor18() {
  return const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: vmsOrangeColor,
    fontFamily: readexFontFamily,
  );
}

BoxDecoration greyBgDecoration() {
  return const BoxDecoration(color: bgColor);
}

LinearGradient appBarGradient = LinearGradient(
  colors: [iitBgThemeColor, vmsHalfWhiteColor], // Customize your gradient colors
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  // end: Alignment.topRight,
);

const String readexFontFamily = 'ReadexPro';

const Color buttonColorRed = Color(0xffc12426);
const Color textColorBlue = Color(0xff419cca);
const Color quickAccessTextColor = Color(0xff178ac3);
const Color textColorRed = Color(0xffc12426);
const Color tabBarTextColor = Color(0xff1B99D6);
const Color bgColor = Color(0xffE4E5E6);
const Color bgBlueColor = Color(0xff1B99D6);
const Color colorRed = Color(0xffC12426);
const Color colorGreen = Color(0xff5BA344);
const Color iitBgThemeColor = Color(0xfff8f0e1);
const Color colorGrey = Color(0xffEBEBEB);
const Color howToConnectBtnClr = Color(0xff1B99D6);
const Color radioBtnRedClr = Color(0xffC12426);
const Color cardBgClr = Color(0xffF0F0F0);
const Color whiteTextColor = Color(0xffF0F0F0);
const Color secondaryTextColor = Color(0xff585858);
const Color errorCodeTextClr = Color(0xff282828);
const Color riskAssessmentBox = Color(0xffF0F0F0);
const Color colorBlack = Color(0xff000000);
const Color colorWhite = Color(0xffffffff);
const Color commonBottomDividerColor = Color(0xffF6F6F6);
const Color commonBottomTextRedColor = Color(0xffE83627);
const Color vmsOrangeColor = Color(0xffEF4E23);
const Color vmsWhiteColor = Color(0xffE3E3E3);
Color vmsHalfWhiteColor = const Color(0xffE3E3E3).withOpacity(0.80);
const Color vmsGreyColor = Color(0xff737373);
Color? greyColor = Colors.grey[200];
const Color vmsAppBarOrangeColor = Color(0xff341c17);
const Color vmsCardBgColor = Color(0xff212121);
const Color vmsCardSecondBgColor = Color(0xff2F2F2F);
const Color vmsBlackColor = Color(0xff151515);

