import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vms_application/utils/common_loader_controller/common_loader.dart';
import 'package:vms_application/utils/common_widgets/common_reusable_widgets.dart';
import 'package:vms_application/utils/constant/sizeconfig.dart';

// ignore: must_be_immutable
class UserAuthenticationUsingQR extends StatefulWidget {
  const UserAuthenticationUsingQR({super.key});

  @override
  State<UserAuthenticationUsingQR> createState() => _UserAuthenticationUsingQRState();
}

class _UserAuthenticationUsingQRState extends State<UserAuthenticationUsingQR> {
  final storage = GetStorage();
  bool loaderActivated = false;
  final CommonLoaderController commonLoaderController =
      Get.put(CommonLoaderController());

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            children: [
              customSizedBox(20),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                leading: InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                ),
                title:  const Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text(
                    "Scan QR Code \nto Authenticate User",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),
              customSizedBox(125),
              Obx(
                () {
                  return commonLoaderController.isLoading.value == true
                      ? Card(
                    child: SizedBox(
                      height: getProportionateScreenHeight(200),
                      width: getProportionateScreenWidth(250),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Please wait"),
                          CircularProgressIndicator.adaptive(),
                          Text("authenticating the user")
                        ],
                      ),
                    ),
                  )
                      : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    height: getProportionateScreenHeight(250),
                    width: getProportionateScreenWidth(250),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: QRView(
                        key: GlobalKey(debugLabel: 'QR'),
                        onQRViewCreated: (QRViewController controller) {
                          controller.scannedDataStream.listen((scanData) {
                            dynamic newData = scanData.code!;
                            debugPrint(newData);
                            // Close the camera and dispose the controller
                            controller.pauseCamera();
                            controller.dispose();
                          });
                        },
                        overlay: QrScannerOverlayShape(
                            borderRadius: 12.0,
                            overlayColor: Colors.black.withOpacity(0.40),
                            borderWidth: 5.0,
                            borderLength: 30.0,
                            borderColor: Colors.white),
                      ),
                    ),
                  );
                },
              ),
              customSizedBox(100),
              const Text(
                "Align QR Code within the frame to scan",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
