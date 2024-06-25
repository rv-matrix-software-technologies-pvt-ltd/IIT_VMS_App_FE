import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vms_application/controllers/security_user_view_controller/security_user_view_controller.dart';
import 'package:vms_application/models/visitor_data_model/visitor_data_model.dart';
import 'package:vms_application/utils/common_widgets/common_reusable_widgets.dart';
import 'package:vms_application/utils/constant/sizeconfig.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/constant/styles.dart';

class SecurityUserScreen extends StatefulWidget {
  const SecurityUserScreen({super.key});

  @override
  State<SecurityUserScreen> createState() => _SecurityUserScreenState();
}

class _SecurityUserScreenState extends State<SecurityUserScreen>
    with TickerProviderStateMixin {
  final SecurityUserManagementController controller =
      Get.put(SecurityUserManagementController());
  late TabController _tabController;
  final storage = GetStorage();

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('IIT Madras VMS'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              commonGetDialog(
                  contentText: "Are you sure",
                  confirmButtonName: "Logout",
                  cancelButtonName: "Cancel",
                  titleText: "Logout",
                  onPressedFunction: () async {
                    const secureStorage =
                    FlutterSecureStorage();
                    final storage = GetStorage();
                    await storage.erase();
                    await secureStorage.deleteAll();
                    Get.offAndToNamed(loginRoute);
                  },
              onPressedCancelFunction: () => Get.back());
            },
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello, Security',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              customSizedBox15(),
              _buildStatistics(),
              customSizedBox10(),
              _buildTabView(),
              customSizedBox10(),
              _buildVisitorList(),
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics), label: 'Analytics'),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_note_rounded), label: 'Add Visitor'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_2_rounded), label: 'Scan'),
        ],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        currentIndex: 0, // Set the default selected index
        onTap: (index) {
          debugPrint("switch case : $index");
          switch (index) {
            case 0:
              Get.toNamed(visitorUserRoute);
              break;
            case 1:
              break;
            case 2:
              break;
            case 3:
              bool? isRequested =
              storage.read('cameraPermissionRequested');
              if (isRequested == null) {
                customDialogPopups(
                    context: context,
                    icon: Image.asset(successIconImg),
                    title: cameraAccessDialogTitleMsg,
                    msg: customCameraAccessDialogMsg,
                    btnOneName: wifiDialogBtnOne,
                    btnTwoName: wifiDialogBtnTwo,
                    callbackOneAction: () => Get.back(),
                    callbackTwoAction: () async {
                      Get.back();
                      await requestCameraPermissions(
                          failureToast:
                          'Camera permission denied',
                          successToast:
                          'Camera permission granted');
                    });
                bool? isRequested = storage.read('cameraPermissionRequested');
                if (isRequested == true) Get.toNamed(securityQRAuthenticateRoute);
              }
              else {
                Get.toNamed(securityQRAuthenticateRoute);
              }
              break;
            default:
              Get.toNamed(visitorUserRoute);
          }
          // Handle navigation
        },
      ),
    );
  }

  Widget _buildStatistics() {
    return Obx(() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatisticCard(
              'Total Visitor', 'Registered', controller.totalRegistered.value),
          _buildStatisticCard(
              'Total Visitor', 'In Campus', controller.totalInCampus.value),
          _buildStatisticCard(
              'Total Visitor', 'Exited Campus', controller.totalExited.value),
        ],
      );
    });
  }

  Widget _buildStatisticCard(String title, String status, int value) {
    return Card(
      color: Colors.blue[200],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              title,
              style: commonTextStyle14Black(),
            ),
            customSizedBox15(),
            RichText(
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: status,
                  style: const TextStyle(
                      fontFamily: readexFontFamily,
                      fontSize: 13,
                      color: vmsBlackColor)),
            ),
            customSizedBox10(),
            Text(
              value.toString(),
              style: commonTextStyle14Black(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTabView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      ),
      height: getProportionateScreenHeight(50),
      // color: Colors.grey[300],
      padding: const EdgeInsets.symmetric(
        // horizontal: 5,
        vertical: 2,
      ),
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: vmsCardBgColor,
        ),
        controller: _tabController,
        tabs: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Tab(
              text: 'In Campus',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3.0),
            child: Tab(text: 'Due to Arrive'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Tab(text: 'History'),
          ),
        ],
      ),
    );
  }

  Widget _buildVisitorList() {
    return Expanded(
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          _buildVisitorTabContent('In Campus'),
          _buildVisitorTabContent('Due to Arrive'),
          _buildVisitorTabContent('History'),
        ],
      ),
    );
  }

  Widget _buildVisitorTabContent(String tabType) {
    return Obx(() {
      List<Visitor> filteredVisitors;
      if (tabType == 'In Campus') {
        filteredVisitors = controller.visitors
            .where((visitor) => visitor.entryDateTime.isBefore(DateTime.now()))
            .toList();
      } else if (tabType == 'Due to Arrive') {
        filteredVisitors = controller.visitors
            .where((visitor) => visitor.entryDateTime.isAfter(DateTime.now()))
            .toList();
      } else {
        filteredVisitors = controller.visitors.toList();
      }
      if (filteredVisitors.isNotEmpty) {
        return ListView.builder(
          itemCount: filteredVisitors.length,
          itemBuilder: (context, index) {
            final visitor = filteredVisitors[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(iitLogo,
                  height: getProportionateScreenHeight(75),
                  width: getProportionateScreenWidth(75),),
                  SizedBox(width: getProportionateScreenWidth(16)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(visitor.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text('Building Name: ${visitor.building}'),
                        Text('Contact Person: ${visitor.contact}'),
                        Text('Entry Date/Time: ${visitor.entryDateTime}'),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }
      else {
        return Center(
          child: Text("No data available",
            softWrap: true,
            style: commonTextStyle16(),),
        );
      }
    });
  }
}
