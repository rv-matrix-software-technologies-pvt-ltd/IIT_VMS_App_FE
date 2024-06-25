import 'package:get/get.dart';

class CommonLoaderController extends GetxController {
  var isLoading = false.obs;
  var fullScreenLoader = true.obs;
  bool fullScreenLoaderBool = true;

  @override
  void onClose() {
    super.onClose();
  }

  void showLoader() {
    isLoading.value = true;
  }

  void hideLoader() {
    isLoading.value = false;
  }

  void showFullScreenLoader() {
    fullScreenLoaderBool = true;
    fullScreenLoader.value = true;
  }

  void hideFullScreenLoader() {
    fullScreenLoaderBool = false;
    fullScreenLoader.value = false;
  }
}
