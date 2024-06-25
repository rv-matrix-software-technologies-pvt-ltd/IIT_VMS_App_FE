import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_application/utils/common_widgets/common_reusable_widgets.dart';
import 'package:vms_application/utils/constant/sizeconfig.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/constant/styles.dart';
import 'package:vms_application/utils/storage_preference/secured_storage.dart';

class CommonNoInternetView extends StatefulWidget {
  final String? screenLoadedFrom;
  const CommonNoInternetView({this.screenLoadedFrom,super.key});

  @override
  State<CommonNoInternetView> createState() => _CommonNoInternetViewState();
}

class _CommonNoInternetViewState extends State<CommonNoInternetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iitBgThemeColor,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: Container(),
      ),
      body: SafeArea(
        child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              // alignment: Alignment.center,
              children: [
                Align(
                  // alignment: Alignment.center,
                  child: Image.asset("assets/icons/iit_logo.png",
                  height: getProportionateScreenHeight(150),
                  width: getProportionateScreenWidth(150),),
                ),
                customSizedBox(50),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[

                    RichText(
                      text: TextSpan(
                        text: "Oooops",
                        style: commonStyleModify(
                            textColor: vmsBlackColor,
                            fontsize: 18,
                            fontweight: FontWeight.w700),
                        children: <TextSpan>[
                          TextSpan(
                              text: '!',
                              style: commonStyleModify(
                                  fontsize: 18,
                                  textColor: vmsOrangeColor,
                                  fontweight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    customSizedBox20(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Something went wrong.\n Please try again",
                          textAlign: TextAlign.center,
                          style : commonStyleModify(
                              fontsize: 15,
                              textColor: vmsBlackColor,
                              fontweight: FontWeight.w400)),
                    ),
                    customSizedBox20(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                      child : ElevatedButton(
                        onPressed: () async {
                          String? userId = await SecureStorage.getUserId();
                          if (userId != null) {
                            Get.toNamed(visitorUserRoute);
                          }
                          else {
                            Get.toNamed(visitorUserRoute);
                          }
                        },
                        style: alertWindowWithUserActionBgButtonStyle(),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Try again',
                            style: commonStyleModify(
                              fontsize: 14,
                              textColor: vmsWhiteColor,
                              fontweight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    customSizedBox20(),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
