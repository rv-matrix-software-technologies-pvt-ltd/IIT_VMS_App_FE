import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vms_application/utils/common_widgets/common_reusable_widgets.dart';
import 'package:vms_application/utils/constant/sizeconfig.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final storage = GetStorage();
  Map<String, dynamic>? cachedData;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(
          child: Container(
        // width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(welcomeBgImg), fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customSizedBox(50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Stack(
                    children: [
                      Container(
                        height: getProportionateScreenHeight(2),
                        // width: double.infinity,
                        color: Colors.transparent,
                      ),
                      Container(
                        height: getProportionateScreenHeight(2),
                        width: getProportionateScreenWidth(50),
                        color: Colors.transparent,
                      )
                    ],
                  ),
                ),
                customSizedBox20(),
              ],
            ),
      ),
    ));
  }
}
