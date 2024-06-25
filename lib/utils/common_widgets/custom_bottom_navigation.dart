import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vms_application/utils/common_loader_controller/common_loader.dart';
import 'package:vms_application/utils/common_widgets/common_reusable_widgets.dart';
import 'package:vms_application/utils/constant/sizeconfig.dart';
import 'package:vms_application/utils/constant/styles.dart';

// ignore: must_be_immutable
class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final String selectedMenu;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  bool isSelected = true;
  final storage = GetStorage();

  bool selectedMenuBool = true;
  bool isLoading = true;

  List<String> bottomMenuNames = [
    'Feeds',
    'Home',
    'Enquiry'
  ];

  int selectedIndex = 0;
  // RxInt selectedIndex = 0.obs;

  final CommonLoaderController commonLoaderController = Get.put(CommonLoaderController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double bottomNavigationSize = Platform.isIOS ? 94 : 60;
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      height: getProportionateScreenHeight(bottomNavigationSize),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.70),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        maintainBottomViewPadding: true,
        minimum: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  debugPrint('index 0 is pressed');
                  onTappedMenu(0);
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Expanded(
                      //   flex: 2,
                      //   child: bottomMenuIcons[0],
                      // ),
                      SizedBox(height: getProportionateScreenHeight(4)),
                      Expanded(
                        flex: 2,
                        child: Obx(() => Text(
                          commonLoaderController.fullScreenLoader.value
                              ? bottomMenuNames[0].toString()
                              : bottomMenuNames[0].toString(),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            color: widget.selectedMenu == 'feeds'
                                // ? commonBottomTextRedColor
                                ? colorBlack
                                : Colors.white,
                            fontWeight: widget.selectedMenu == 'feeds'
                                ? FontWeight.w400
                                : FontWeight.w500,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
                child: customVerticalDivider()),
            Expanded(
              flex: 4,
              child: GestureDetector(
                onTap: () {
                  debugPrint('index 1 is pressed');
                  onTappedMenu(1);
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Expanded(
                      //   flex: 2,
                      //   child: bottomMenuIcons[1],
                      // ),
                      SizedBox(height: getProportionateScreenHeight(4)),
                      Expanded(
                        flex: 2,
                        child: Obx(() => Text(
                          commonLoaderController.fullScreenLoader.value
                              ? bottomMenuNames[1].toString()
                              : bottomMenuNames[1].toString(),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            color: widget.selectedMenu == 'home'
                            // ? commonBottomTextRedColor
                                ? colorBlack
                                : Colors.white,
                            fontWeight: widget.selectedMenu == 'home'
                                ? FontWeight.w400
                                : FontWeight.w500,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: customVerticalDivider()),
            Expanded(
              flex: 4,
              child: GestureDetector(
                onTap: () {
                  debugPrint('index 2 is pressed');
                  onTappedMenu(2);
                },
                child: Padding(
                  // changed from 2 to 20
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Expanded(
                      //   flex: 2,
                      //   child: bottomMenuIcons[2],
                      // ),
                      SizedBox(height: getProportionateScreenHeight(4)),
                      Expanded(
                        flex: 2,
                        child: Obx(() => Text(
                          commonLoaderController.fullScreenLoader.value
                              ? bottomMenuNames[2].toString()
                              : bottomMenuNames[2].toString(),
                        textAlign: TextAlign.center,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            color: widget.selectedMenu == 'enquiry'
                            // ? commonBottomTextRedColor
                                ? colorBlack
                                : Colors.white,
                            fontWeight: widget.selectedMenu == 'enquiry'
                                ? FontWeight.w400
                                : FontWeight.w500,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTappedMenu(index) {
    switch (index) {
      case 0:
        // Get.to(() => const CommonFeedsView(screenLoadedFrom: noLoginText));
        break;
      case 1:
        // Get.toNamed('/firmware-update');
        // Get.to(() => const HomePageNoLoginView());
        break;
      case 2:
        // Get.to(() => const HomepageLoggedInView());
        // Get.to(() => const CommonEnquiryView());
        break;
      default:
        // Get.to(() => const HomePageNoLoginView());
        break;
    }
  }
}