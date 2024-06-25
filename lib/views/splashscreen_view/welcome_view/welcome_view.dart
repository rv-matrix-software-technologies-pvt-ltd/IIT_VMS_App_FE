import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/constant/styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/welcome_bg.jpg"),
                      fit: BoxFit.cover,
                    ))),
            Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: ElevatedButton(
                      onPressed: () {
                        final storage = GetStorage();
                        storage.write(firstClick, valueTrue);
                        Get.offAndToNamed(loginRoute);
                      },
                      style : alertWindowWithUserActionBgButtonStyle(),
                      child: const Text("Get Started",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500,
                              color: vmsWhiteColor))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
