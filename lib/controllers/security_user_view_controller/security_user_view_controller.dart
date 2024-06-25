import 'package:get/get.dart';
import 'package:vms_application/models/visitor_data_model/visitor_data_model.dart';

class SecurityUserManagementController extends GetxController {
  var totalRegistered = 0.obs;
  var totalInCampus = 2.obs;
  var totalExited = 4.obs;
  var currentIndex = 0.obs;

  var visitors = [
    Visitor(
        id: 'VS12000001',
        name: 'VisitorUser1',
        building: 'Dept. of Mathematics',
        contact: '4479',
        entryDateTime: DateTime.parse('2024-04-29 10:26:33')),
    Visitor(
        id: 'ParentUser02',
        name: 'ParentUser02',
        building: 'DoMS',
        contact: 'Rahul',
        entryDateTime: DateTime.parse('2024-04-29 10:54:55')),
  ].obs;
}