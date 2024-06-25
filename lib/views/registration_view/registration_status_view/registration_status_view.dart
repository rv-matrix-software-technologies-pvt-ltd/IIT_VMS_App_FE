import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_application/utils/common_widgets/common_appbar.dart';
import 'package:vms_application/utils/common_widgets/common_reusable_widgets.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/constant/styles.dart';

class RegistrationStatusView extends StatelessWidget {
  final bool isSuccess = true;
  const RegistrationStatusView({super.key}); // Change this to false to simulate a rejection.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iitBgThemeColor,
      appBar: commonAppbar(screenName: "Entry Pass Registration Status"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSuccess ? const SuccessWidget() : const RejectionWidget(),
              customSizedBox20(),
              ElevatedButton.icon(
                onPressed: () {
                  // Logic to track application form status can be added here.
                  // Get.snackbar("Info", "Tracking application form...");
                  commonGetDialog(
                      contentText: "kindly confirm which flow to be loaded",
                      confirmButtonName: "Approve",
                      cancelButtonName: "Pending",
                      titleText: "Application Status",
                      onPressedFunction: () async {
                        Get.toNamed(visitorUserRoute,
                        arguments: approveText);
                      },
                      onPressedCancelFunction: () {
                        Get.toNamed(visitorUserRoute,
                            arguments: pendingText);
                      });
                },
                icon: const Icon(Icons.home,
                color: vmsWhiteColor,),
                label: const Text('Track Your Application Form',
                style: TextStyle(
                  color: vmsWhiteColor
                ),),
                style: alertWindowWithUserActionBgButtonStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Icon(Icons.check_circle, size: 100, color: Colors.green),
        Image.asset(successIconImg),
        customSizedBox20(),
        const Text(
          'Submitted Successfully',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        customSizedBox10(),
        const Text(
          'While we validate your application form, you can click the button below to track your application status.',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class RejectionWidget extends StatelessWidget {
  const RejectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(Icons.error, size: 100, color: Colors.red),
        SizedBox(height: 20),
        Text(
          'Submission Failed',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          'Unfortunately, your application form could not be submitted. Please try again later.',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
