import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_application/utils/common_widgets/animated_bottom_navigation.dart';

class VisitorManagementUserController extends GetxController {
  var userName = 'User Name!'.obs;
  // var applicationStatus = 'Under Processing'.obs;
  var applicationStatus = 'Accepted'.obs;

  RxList<RxIconModel>? myIcons = RxList([
  RxIconModel(id: 0, iconData: Icons.home),
  RxIconModel(id: 1, iconData: Icons.airplane_ticket),
  RxIconModel(id: 2, iconData: Icons.diamond),
  RxIconModel(id: 3, iconData: Icons.supervised_user_circle_rounded),
  RxIconModel(id: 4, iconData: Icons.notifications_active_outlined)]);

}