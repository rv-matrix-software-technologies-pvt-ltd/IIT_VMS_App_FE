import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_application/utils/common_widgets/common_reusable_widgets.dart';
import 'package:vms_application/utils/constant/sizeconfig.dart';
import 'package:vms_application/utils/constant/styles.dart';

class AnimatedBottomBar extends StatelessWidget {
  final int currentIcon;
  final List<RxIconModel> icons;
  final ValueChanged<int>? onTap;
  const AnimatedBottomBar({
    Key? key,
    required this.currentIcon,
    required this.onTap,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(19),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          // color: const Color(0xffFFFCEE).withOpacity(0.85),
          color: Colors.white.withOpacity(0.85),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: icons
              .map(
                (icon) => GestureDetector(
              onTap: () => onTap?.call(icon.id.value),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: [
                  AnimatedSize(
                    duration: const Duration(milliseconds: 900),
                    child: Icon(
                      icon.iconData.value,
                      size: currentIcon == icon.id.value ? 26 : 23,
                      color: currentIcon == icon.id.value
                          ? vmsBlackColor
                          : vmsGreyColor,
                    ),
                  ),
                  customSizedBox(2),
                  Visibility(
                    visible: currentIcon == icon.id.value,
                    child: Container(
                      width: getProportionateScreenWidth(25), // Adjust the width of the line
                      height: getProportionateScreenHeight(2), // Adjust the height of the line
                      color: vmsBlackColor, // Line color
                    ),)
                ],
              ),
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}

class RxIconModel {
  final RxInt id;
  final Rx<IconData> iconData;

  RxIconModel({required int id, required IconData iconData})
      : id = id.obs,
        iconData = iconData.obs;
}