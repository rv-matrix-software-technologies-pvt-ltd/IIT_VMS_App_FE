import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_application/controllers/visitor_management_user_screen_controller/visitor_management_user_controller.dart';
import 'package:vms_application/utils/common_widgets/common_reusable_widgets.dart';
import 'package:vms_application/utils/constant/sizeconfig.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/constant/styles.dart';

class VisitorManagementUserScreen extends StatefulWidget {
  const VisitorManagementUserScreen({super.key});

  @override
  State<VisitorManagementUserScreen> createState() =>
      _VisitorManagementUserScreenState();
}

class _VisitorManagementUserScreenState
    extends State<VisitorManagementUserScreen> {
  final VisitorManagementUserController controller =
      Get.put(VisitorManagementUserController());

  @override
  void initState() {
    controller.applicationStatus.value = Get.arguments ?? pendingText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('IIT Madras VMS'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => controller.applicationStatus.value == acceptedText
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, ${controller.userName}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    customSizedBox(6),
                    const Text(
                        'Welcome to IIT Madras Visitor Management System'),
                    customSizedBox15(),
                    Row(
                      children: [
                        Text(
                          "Check-In/Out History",
                          style: commonTextStyle18(),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "View More",
                              style: TextStyle(
                                color: Colors.blue[400],
                              ),
                            ))
                      ],
                    ),
                    customSizedBox15(),
                    Container(
                      decoration: BoxDecoration(
                        color: vmsGreyColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        '21st May 2024',
                                        style: TextStyle(
                                            color: vmsBlackColor,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: readexFontFamily),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'School Parent',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.blue[400],
                                            fontWeight: FontWeight.w400,
                                            fontFamily: readexFontFamily),
                                      ),
                                    ],
                                  ),
                                  customSizedBox10(),
                                  Row(
                                    children: [
                                      Text(
                                        'Entry : 9:00 AM',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[300],
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(20),
                                      ),
                                      Text(
                                        'Exit : 11:30 AM',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.red[400],
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  customSizedBox10(),
                                  const Text(
                                    'Vehicle : Honda Activa',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: vmsGreyColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  customSizedBox5(),
                                  const Text(
                                    'Vehicle No : TN-10-AB 1234',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: vmsGreyColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, ${controller.userName}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    customSizedBox(6),
                    const Text(
                        'Welcome to IIT Madras Visitor Management System'),
                    customSizedBox15(),
                    Container(
                      // width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'ENTRY PASS APPLICATION FORM',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: readexFontFamily),
                                  ),
                                  const Text(
                                    'School Parent Pass',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  customSizedBox10(),
                                  Obx(() => ElevatedButton(
                                        onPressed: null, // Button is disabled
                                        style: ElevatedButton.styleFrom(
                                          // ignore
                                          primary: Colors.amber,
                                        ),
                                        child: Text(
                                          controller.applicationStatus.value,
                                          style: const TextStyle(
                                              color: vmsWhiteColor),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  'https://via.placeholder.com/150',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics), label: 'Analytics'),
          BottomNavigationBarItem(icon: Icon(Icons.badge), label: 'Passes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        currentIndex: 0, // Set the default selected index
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed(visitorUserRoute);
              break;
            case 1:
              break;
            case 2:
              Get.toNamed(dynamicIDCardRoute);
              break;
            case 3:
              break;
            case 4:
              Get.toNamed(securityUserRoute);
            default:
              Get.toNamed(visitorUserRoute);
          }
          // Handle navigation
        },
      ),
    );
  }
}
