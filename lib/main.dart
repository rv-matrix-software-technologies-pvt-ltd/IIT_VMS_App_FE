import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_application/controllers/splashscreen_controller/splashscreen_controller.dart';
import 'package:vms_application/utils/common_widgets/custom_theme.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/routes/page_routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      theme: customTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: splashRoute,
      initialBinding: SplashBinding(),
      getPages: appRoutes,
    );
  }
}
