import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vms_application/utils/common_loader_controller/common_loader.dart';
import 'package:vms_application/utils/common_reusable_class/common_classes.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/constant/urls.dart';
import 'package:vms_application/utils/networkcalls/network_calls.dart';

class RegistrationController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final firstName = ''.obs;
  final lastName = ''.obs;
  final isValidEmail = true.obs;
  final fullName = ''.obs;
  final isFullNameValid = true.obs;
  final isFirstNameValid = true.obs;
  final isLastNameValid = true.obs;
  final teamSize = ''.obs;
  final phoneNumber = ''.obs;
  final location = ''.obs;
  final interest = ''.obs;
  final selectedLocation = ''.obs;
  final isPasswordValid = true.obs;
  final isPhoneNumberValid = true.obs;
  RxBool isUploaded = false.obs;
  Rx<File?> selectedFile = Rx<File?>(null);
  var selectedImage = Rx<File?>(null);
  var userType = UserType.schoolstaff.obs;

  TextEditingController passwordTextController = TextEditingController();

  // Common Information Text Controller
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController schoolNameTextController = TextEditingController();

  // General Vehicle Information
  TextEditingController vehicleTypeTextController = TextEditingController();
  TextEditingController vehicleMakeAndModelTextController = TextEditingController();
  TextEditingController vehicleRegNoTextController = TextEditingController();

  // Access Gate Information Text Controller
  TextEditingController gateNameTextController = TextEditingController();

  // Project Staff Pass Text Controller -- Common fields - first name, last name, email id, mobile no
  TextEditingController departmentTextController = TextEditingController();
  TextEditingController projectTitleTextController = TextEditingController();

  // School Staff Pass Text Controller - Common fields - first name, last name, school name, department, email id, mobile no
  TextEditingController designationNameTextController = TextEditingController();

  // Student Parent Pass Text Controller -- Common fields - first name, last name, school name, email id, mobile no
  TextEditingController studentAdmissionNoTextController = TextEditingController();
  TextEditingController classNameTextController = TextEditingController();
  TextEditingController sectionNameTextController = TextEditingController();
  TextEditingController parentGuardianNameTextController = TextEditingController();


  // Pet Pass Text Controller
  TextEditingController licenseeNameTextController = TextEditingController();
  TextEditingController licenseeDesignationTextController = TextEditingController();
  TextEditingController quartersNoTextController = TextEditingController();
  TextEditingController licenseeEmpIdTextController = TextEditingController();
  TextEditingController licenseeEmailIdTextController = TextEditingController();
  TextEditingController licenseePhoneNoTextController = TextEditingController();
  TextEditingController petNameTextController = TextEditingController();
  TextEditingController petBreedTextController = TextEditingController();
  TextEditingController petGenderTextController = TextEditingController();
  TextEditingController petAgeTextController = TextEditingController();

  final CommonLoaderController commonLoaderController = Get.put(CommonLoaderController());

  var isSchoolNameValid = true.obs;
  var isDepartmentValid = true.obs;
  var isDesignationValid = true.obs;
  var isMobileNumberValid = true.obs;
  var isVehicleTypeValid = true.obs;
  var isVehicleModelValid = true.obs;
  var isVehicleNumberValid = true.obs;
  var isGateNameValid = true.obs;
  var isClassNameValid = true.obs;
  var isSectionNameValid = true.obs;
  var isParentNameValid = true.obs;
  var isProjectTitleNameValid = true.obs;

  void commonValidationCheck(String value,RxBool validationBool) {

  }

  void setParentName(String value) {
    parentGuardianNameTextController.text = value;
    isParentNameValid.value = value.isNotEmpty;
  }

  void setProjectTitleName(String value) {
    projectTitleTextController.text = value;
    isProjectTitleNameValid.value = value.isNotEmpty;
  }

  void setSchoolName(String value) {
    schoolNameTextController.text = value;
    isSchoolNameValid.value = value.isNotEmpty;
  }

  void setSectionName(String value) {
    sectionNameTextController.text = value;
    isSectionNameValid.value = value.isNotEmpty;
  }

  void setClassName(String value) {
    classNameTextController.text = value;
    isClassNameValid.value = value.isNotEmpty;
  }

  void setDepartment(String value) {
    departmentTextController.text = value;
    isDepartmentValid.value = value.isNotEmpty;
  }

  void setDesignation(String value) {
    designationNameTextController.text = value;
    isDesignationValid.value = value.isNotEmpty;
  }

  void setVehicleType(String value) {
    vehicleTypeTextController.text = value;
    isVehicleTypeValid.value = value.isNotEmpty;
  }

  void setVehicleMakeAndModel(String value) {
    vehicleMakeAndModelTextController.text = value;
    isVehicleModelValid.value = value.isNotEmpty;
  }

  void setVehicleNumber(String value) {
    vehicleRegNoTextController.text = value;
    isVehicleNumberValid.value = value.isNotEmpty;
  }

  void setGateName(String value) {
    gateNameTextController.text = value;
    isGateNameValid.value = value.isNotEmpty;
  }

  void setEmail(String value) {
    email.value = value;
    isValidEmail.value = EmailValidator.isValid(value);
  }

  void setFirstName(String value) {
      firstName.value = value;
      isFirstNameValid.value = value.isNotEmpty;
  }

  void setLastName(String value) {
      lastName.value = value;
      isLastNameValid.value = value.isNotEmpty;
  }

  void setName(String value) {
    lastName.value = value;
    isLastNameValid.value = value.isNotEmpty;
  }

  void setPassword(String value) {
    if (value.length >= 8) {
      password.value = value;
      isPasswordValid.value = true;
    }
    else {
      isPasswordValid.value = false;
    }
  }

  void setPhoneNumber(String value) {
    if (value.length > 9) {
      phoneNumber.value = value;
      // Check if the input is not empty and consists of only numbers
      isPhoneNumberValid.value = value.isNotEmpty && isNumeric(value);
    }
    else {
      phoneNumber.value = value;
      // Check if the input is not empty and consists of only numbers
      isPhoneNumberValid.value = false;
    }
  }

  // Function to check if a string consists of only numbers
  bool isNumeric(String? str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }


  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpeg', 'jpg', 'png'],
    );

    if (result != null) {
      selectedFile.value = File(result.files.single.path!);
      // uploadExcelFile(file: selectedFile.value);
    }
  }

  registerUser() async {
    commonLoaderController.showLoader();
    Map registerData = {
      'firstName':firstName.value,
      'lastName':lastName.value,
      'emailId':email.value,
      'password':password.value,
      'mobileNumber':phoneNumber.value,
    };
    debugPrint('data sent : $registerData');
    dynamic jsonData = await httpPostMethodApiCall(url: registerUrl,data: registerData);
    debugPrint('knowing the value of jsonData : $jsonData');
    commonLoaderController.hideLoader();
    firstNameTextController.clear();
    lastNameTextController.clear();
    emailTextController.clear();
    passwordTextController.clear();
    phoneNumberTextController.clear();
    if (jsonData["success"] == "true") {
      Get.dialog(const SuccessDialog(message: "Registration Successful",route : loginRoute),
          barrierDismissible: false);
    }
    else {
      Get.dialog(SuccessDialog(message: jsonData["message"],route : loginRoute),
          barrierDismissible: false);
    }
  }

  void openEmailApp(String emailAddress) async {
    String url = 'mailto:$emailAddress';
    if (await canLaunchUrl(Uri.parse(url.toString()))) {
      await launchUrl(Uri.parse(url.toString()));
    } else {
      Get.defaultDialog(
          title: 'Email App Not Found',
          content: const Text(
              'Please choose an email app to continue.'),
          confirm: TextButton(
            child: const Text('Choose App'),
            onPressed: () {
              launchUrl(Uri.parse(url.toString()));
              Get.back();
            },
          )
      );
    }
  }

  void launchDialer(String phoneNumber) async {
    final Uri phoneLaunchUri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(Uri.parse(phoneLaunchUri.toString()))) {
      await launchUrl(Uri.parse(phoneLaunchUri.toString()));
    } else {
      throw 'Could not launch $phoneLaunchUri';
    }
  }
}