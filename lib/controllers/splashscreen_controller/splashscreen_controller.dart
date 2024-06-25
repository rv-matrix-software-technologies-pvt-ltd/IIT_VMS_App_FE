import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';

class SplashBinding extends GetxController implements Bindings {
  @override
  void dependencies() {
    Future.delayed(const Duration(seconds: 1), () async {
      // String? alreadyLoggedIn = await SecureStorage.getLoginToken();
      // if (alreadyLoggedIn != null) {
      //   Get.offAndToNamed(homeRoute);
      // }
      // else {
        final storage = GetStorage();
        String? welcomeRouted = storage.read(firstClick);
        String? userRoute = storage.read(isUser);
        welcomeRouted == null ? Get.offAndToNamed(welcomeRoute) :
        userRoute == null ? Get.offAndToNamed(loginRoute) :
        Get.toNamed(visitorUserRoute,
            arguments: pendingText);
      // }
    });
  }
}