import 'package:get/get.dart';

class VisitorTypeController extends GetxController {
  var selectedVisitorType = ''.obs;
  var selectedVisitorIndex = Rx<int?>(null);

  void setSelectedVisitorType(String type) {
    selectedVisitorType.value = type;
  }
}
