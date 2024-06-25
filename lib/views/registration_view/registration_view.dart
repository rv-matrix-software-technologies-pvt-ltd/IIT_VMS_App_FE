import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_application/controllers/loginscreen_controller/registration_controller/registration_controller.dart';
import 'package:vms_application/utils/common_loader_controller/common_loader.dart';
import 'package:vms_application/utils/common_widgets/common_appbar.dart';
import 'package:vms_application/utils/common_widgets/common_loader.dart';
import 'package:vms_application/utils/common_widgets/common_reusable_widgets.dart';
import 'package:vms_application/utils/constant/sizeconfig.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/constant/styles.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  //region
  final RegistrationController registrationController =
      Get.put(RegistrationController());
  CommonLoaderController commonLoaderController =
      Get.put(CommonLoaderController());
  Map<String, dynamic>? arguments;
  bool selectedBox = false;
  String screenTitle = "";
  UserType? currentUserType;
  late final Map<UserType, List<Map<String, dynamic>>> userFields;
  //endregion

  @override
  void initState() {
    super.initState();
    arguments = Get.arguments;
    if (arguments != null) {
      screenTitle = arguments!["typeName"];
      currentUserType = getUserTypeFromTitle(screenTitle);
      if (currentUserType != null) {
        registrationController.userType.value = currentUserType!;
      }

      userFields = {
        UserType.pet: [
          {
            'label': 'Licensee Name',
            'hint': 'Enter your licensee name',
            'controller': (c) => c.licenseeNameTextController,
            'validation': (c) => c.isFirstNameValid,
            'setter': (c, value) => c.setFirstName(value)
          },
          {
            'label': 'Licensee Designation',
            'hint': 'Enter your licensee designation',
            'controller': (c) => c.licenseeDesignationTextController,
            'validation': (c) => c.isDesignationValid,
            'setter': (c, value) => c.setDesignation(value)
          },
          {
            'label': 'Quarters Number',
            'hint': 'Enter your quarters number',
            'controller': (c) => c.firstNameTextController,
            'validation': (c) => c.isFirstNameValid,
            'setter': (c, value) => c.setFirstName(value)
          },
          {
            'label': 'Licensee Employee ID',
            'hint': 'Enter your licensee employee id',
            'controller': (c) => c.firstNameTextController,
            'validation': (c) => c.isFirstNameValid,
            'setter': (c, value) => c.setFirstName(value)
          },
          {
            'label': 'Licensee Email ID',
            'hint': 'Enter your email-id name',
            'controller': (c) => c.emailTextController,
            'validation': (c) => c.isValidEmail,
            'setter': (c, value) => c.setEmail(value)
          },
          {
            'label': 'Licensee Mobile Number',
            'hint': 'Enter your mobile number',
            'controller': (c) => c.phoneNumberTextController,
            'validation': (c) => c.isPhoneNumberValid,
            'setter': (c, value) => c.setPhoneNumber(value)
          },
          // Pet Details Fields - name, breed, gender, age
          {
            'label': 'Pet Name',
            'hint': 'Enter your pet name',
            'controller': (c) => c.firstNameTextController,
            'validation': (c) => c.isFirstNameValid,
            'setter': (c, value) => c.setFirstName(value)
          },
          {
            'label': 'Pet Breed',
            'hint': 'Enter your pet breed name',
            'controller': (c) => c.firstNameTextController,
            'validation': (c) => c.isFirstNameValid,
            'setter': (c, value) => c.setFirstName(value)
          },
          {
            'label': 'Pet Gender',
            'hint': 'Enter your pet gender',
            'controller': (c) => c.emailTextController,
            'validation': (c) => c.isValidEmail,
            'setter': (c, value) => c.setEmail(value)
          },
          {
            'label': 'Pet Age',
            'hint': 'Enter your pet age',
            'controller': (c) => c.phoneNumberTextController,
            'validation': (c) => c.isPhoneNumberValid,
            'setter': (c, value) => c.setPhoneNumber(value)
          },
          // Access Gate Information fields - gate name
          {
            'label': 'Gate Name',
            'hint': 'Enter your gate name',
            'controller': (c) => c.gateNameTextController,
            'validation': (c) => c.isGateNameValid,
            'setter': (c, value) => c.setGateName(value)
          },
        ],
        // Project Staff Fields - First Name, last name, department, project title, email id, mobile no,
        // vehicle type, vehicle make & model, vehicle registration no, gate name
        UserType.projectstaff: [
          {
            'label': 'First Name',
            'hint': 'Enter your first name',
            'controller': (c) => c.firstNameTextController,
            'validation': (c) => c.isFirstNameValid,
            'setter': (c, value) => c.setFirstName(value)
          },
          {
            'label': 'Last Name',
            'hint': 'Enter your last name',
            'controller': (c) => c.lastNameTextController,
            'validation': (c) => c.isLastNameValid,
            'setter': (c, value) => c.setLastName(value)
          },
          {
            'label': 'Department',
            'hint': 'Enter your department name',
            'controller': (c) => c.departmentTextController,
            'validation': (c) => c.isDepartmentValid,
            'setter': (c, value) => c.setDepartment(value)
          },
          {
            'label': 'Project Title',
            'hint': 'Enter your project title',
            'controller': (c) => c.projectTitleTextController,
            'validation': (c) => c.isProjectTitleNameValid,
            'setter': (c, value) => c.setProjectTitleName(value)
          },
          {
            'label': 'Email ID',
            'hint': 'Enter your email-id name',
            'controller': (c) => c.emailTextController,
            'validation': (c) => c.isValidEmail,
            'setter': (c, value) => c.setEmail(value)
          },
          {
            'label': 'Mobile Number',
            'hint': 'Enter your mobile number',
            'controller': (c) => c.phoneNumberTextController,
            'validation': (c) => c.isPhoneNumberValid,
            'setter': (c, value) => c.setPhoneNumber(value)
          },
          // Vehicle information text fields - vehicle type, vehicle make and model, vehicle registration number
          {
            'label': 'Vehicle Type',
            'hint': 'Enter your vehicle type',
            'controller': (c) => c.vehicleTypeTextController,
            'validation': (c) => c.isVehicleTypeValid,
            'setter': (c, value) => c.setVehicleType(value)
          },
          {
            'label': 'Vehicle Make and Model',
            'hint': 'Enter your vehicle make and model',
            'controller': (c) => c.vehicleMakeAndModelTextController,
            'validation': (c) => c.isVehicleModelValid,
            'setter': (c, value) => c.setVehicleMakeAndModel(value)
          },
          {
            'label': 'Vehicle Registration Number',
            'hint': 'Enter your vehicle registration no',
            'controller': (c) => c.vehicleRegNoTextController,
            'validation': (c) => c.isVehicleNumberValid,
            'setter': (c, value) => c.setVehicleNumber(value)
          },
          // Access Gate Information fields - gate name
          {
            'label': 'Gate Name',
            'hint': 'Enter your gate name',
            'controller': (c) => c.gateNameTextController,
            'validation': (c) => c.isGateNameValid,
            'setter': (c, value) => c.setGateName(value)
          },
        ],
        // School Parent Fields - First Name, last name, school name, student admission no, class, section, email id, mobile no, parent/guardian name,
        // vehicle type, vehicle make & model, vehicle registration no
        UserType.schoolparent: [
          // Basic Information fields - first name, last name, student admission number, school name, class, section, email id, mobile no, parent/guardian name
          {
            'label': 'First Name',
            'hint': 'Enter your first name',
            'controller': (c) => c.firstNameTextController,
            'validation': (c) => c.isFirstNameValid,
            'setter': (c, value) => c.setFirstName(value)
          },
          {
            'label': 'Last Name',
            'hint': 'Enter your last name',
            'controller': (c) => c.lastNameTextController,
            'validation': (c) => c.isLastNameValid,
            'setter': (c, value) => c.setLastName(value)
          },
          {
            'label': 'Student Admission Number',
            'hint': 'Enter your student admission number',
            'controller': (c) => c.lastNameTextController,
            'validation': (c) => c.isLastNameValid,
            'setter': (c, value) => c.setLastName(value)
          },
          {
            'label': 'School Name',
            'hint': 'Enter your school name',
            'controller': (c) => c.schoolNameTextController,
            'validation': (c) => c.isSchoolNameValid,
            'setter': (c, value) => c.setSchoolName(value)
          },
          {
            'label': 'Class Name',
            'hint': 'Enter your class name',
            'controller': (c) => c.classNameTextController,
            'validation': (c) => c.isClassNameValid,
            'setter': (c, value) => c.setClassName(value)
          },
          {
            'label': 'Section Name',
            'hint': 'Enter your section name',
            'controller': (c) => c.sectionNameTextController,
            'validation': (c) => c.isSectionNameValid,
            'setter': (c, value) => c.setSectionName(value)
          },
          {
            'label': 'Email ID',
            'hint': 'Enter your email-id name',
            'controller': (c) => c.emailTextController,
            'validation': (c) => c.isValidEmail,
            'setter': (c, value) => c.setEmail(value)
          },
          {
            'label': 'Mobile Number',
            'hint': 'Enter your mobile number',
            'controller': (c) => c.phoneNumberTextController,
            'validation': (c) => c.isPhoneNumberValid,
            'setter': (c, value) => c.setPhoneNumber(value)
          },
          {
            'label': 'Parent/Guardian Name',
            'hint': 'Enter your parent/guardian name',
            'controller': (c) => c.parentGuardianNameTextController,
            'validation': (c) => c.isParentNameValid,
            'setter': (c, value) => c.setParentName(value)
          },
          // Vehicle information text fields - vehicle type, vehicle make and model, vehicle registration number
          {
            'label': 'Vehicle Type',
            'hint': 'Enter your vehicle type',
            'controller': (c) => c.vehicleTypeTextController,
            'validation': (c) => c.isVehicleTypeValid,
            'setter': (c, value) => c.setVehicleType(value)
          },
          {
            'label': 'Vehicle Make and Model',
            'hint': 'Enter your vehicle make and model',
            'controller': (c) => c.vehicleMakeAndModelTextController,
            'validation': (c) => c.isVehicleModelValid,
            'setter': (c, value) => c.setVehicleMakeAndModel(value)
          },
          {
            'label': 'Vehicle Registration Number',
            'hint': 'Enter your vehicle registration no',
            'controller': (c) => c.vehicleRegNoTextController,
            'validation': (c) => c.isVehicleNumberValid,
            'setter': (c, value) => c.setVehicleNumber(value)
          },
          // Access Gate Information fields - gate name
          {
            'label': 'Gate Name',
            'hint': 'Enter your gate name',
            'controller': (c) => c.gateNameTextController,
            'validation': (c) => c.isGateNameValid,
            'setter': (c, value) => c.setGateName(value)
          },
        ],
        // School Staff Fields - First Name, last name, school name, department, designation, email id, mobile no,
        // vehicle type, vehicle make & model, vehicle registration no
        UserType.schoolstaff: [
          {
            'label': 'First Name',
            'hint': 'Enter your first name',
            'controller': (c) => c.firstNameTextController,
            'validation': (c) => c.isFirstNameValid,
            'setter': (c, value) => c.setFirstName(value)
          },
          {
            'label': 'Last Name',
            'hint': 'Enter your last name',
            'controller': (c) => c.lastNameTextController,
            'validation': (c) => c.isLastNameValid,
            'setter': (c, value) => c.setLastName(value)
          },
          {
            'label': 'School Name',
            'hint': 'Enter your school name',
            'controller': (c) => c.schoolNameTextController,
            'validation': (c) => c.isSchoolNameValid,
            'setter': (c, value) => c.setSchoolName(value)
          },
          {
            'label': 'Department',
            'hint': 'Enter your department name',
            'controller': (c) => c.departmentTextController,
            'validation': (c) => c.isSchoolNameValid,
            'setter': (c, value) => c.setSchoolName(value)
          },
          {
            'label': 'Designation',
            'hint': 'Enter your designation name',
            'controller': (c) => c.designationNameTextController,
            'validation': (c) => c.isSchoolNameValid,
            'setter': (c, value) => c.setSchoolName(value)
          },
          {
            'label': 'Email ID',
            'hint': 'Enter your email-id name',
            'controller': (c) => c.emailTextController,
            'validation': (c) => c.isValidEmail,
            'setter': (c, value) => c.setEmail(value)
          },
          {
            'label': 'Mobile Number',
            'hint': 'Enter your mobile number',
            'controller': (c) => c.phoneNumberTextController,
            'validation': (c) => c.isPhoneNumberValid,
            'setter': (c, value) => c.setPhoneNumber(value)
          },
          // Vehicle information text fields - vehicle type, vehicle make and model, vehicle registration number
          {
            'label': 'Vehicle Type',
            'hint': 'Enter your vehicle type',
            'controller': (c) => c.vehicleTypeTextController,
            'validation': (c) => c.isVehicleTypeValid,
            'setter': (c, value) => c.setVehicleType(value)
          },
          {
            'label': 'Vehicle Make and Model',
            'hint': 'Enter your vehicle make and model',
            'controller': (c) => c.vehicleMakeAndModelTextController,
            'validation': (c) => c.isVehicleModelValid,
            'setter': (c, value) => c.setVehicleMakeAndModel(value)
          },
          {
            'label': 'Vehicle Registration Number',
            'hint': 'Enter your vehicle registration no',
            'controller': (c) => c.vehicleRegNoTextController,
            'validation': (c) => c.isVehicleNumberValid,
            'setter': (c, value) => c.setVehicleNumber(value)
          },
          // Access Gate Information fields - gate name
          {
            'label': 'Gate Name',
            'hint': 'Enter your gate name',
            'controller': (c) => c.gateNameTextController,
            'validation': (c) => c.isGateNameValid,
            'setter': (c, value) => c.setGateName(value)
          },
        ],
      };
    }
  }

  UserType? getUserTypeFromTitle(String? title) {
    switch (title) {
      case 'Pet':
        return UserType.pet;
      case 'Project Staff':
        return UserType.projectstaff;
      case 'School Parent':
        return UserType.schoolparent;
      case 'School Faculty/Staff':
        return UserType.schoolstaff;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iitBgThemeColor,
      extendBody: true,
      appBar: commonAppbar(titleText: "$screenTitle Registration"),
      body: SafeArea(
        child: Obx(
          () {
            if (commonLoaderController.isLoading.value) {
              return customCircularLoader();
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Obx(() {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonBodyHeadingText('Basic Information'),
                        customSizedBox5(),
                        ...userFields[registrationController.userType.value]!
                            .map((field) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              commonBodyHeadingText(field['label']),
                              customSizedBox(7),
                              commonTextField(
                                hintText: field['hint'],
                                errorBool:
                                    field['validation'](registrationController),
                                errorText: '${field['label']} is required',
                                onChangedPressed: (value) => field['setter'](
                                    registrationController, value),
                                textEditingController:
                                    field['controller'](registrationController),
                              ),
                              customSizedBox(20),
                            ],
                          );
                        }).toList(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonBodyHeadingText('Document Information'),
                            customSizedBox5(),
                            GestureDetector(
                              onTap: () async {
                                await registrationController.pickImage();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      screenTitle == "Pet" ? "Photo" : "Driving License",
                                      style: commonTextStyle16(),
                                    ),
                                    Visibility(
                                      visible: !registrationController.isUploaded.value,
                                      replacement: Text(
                                        "Uploaded",
                                        style: commonTextStyle14Black(),
                                      ),
                                      child: Card(
                                        color: vmsCardBgColor,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color:
                                              vmsGreyColor), // Add a black border
                                          borderRadius: BorderRadius.circular(
                                              20.0), // Adjust border radius as needed
                                        ),
                                        child: SizedBox(
                                          height: getProportionateScreenHeight(35),
                                          width: getProportionateScreenWidth(75),
                                          child: Center(
                                            child: Text(
                                              'Upload',
                                              style: commonStyleModify(
                                                  textColor: vmsWhiteColor,
                                                  fontweight: FontWeight.w400,
                                                  fontsize: 13),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            customSizedBox5(),
                            GestureDetector(
                              onTap: () async {
                                await registrationController.pickImage();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      screenTitle == "Pet" ? "Pet Vaccination Certificate" :"ID Card",
                                      style: commonTextStyle16(),
                                    ),
                                    Visibility(
                                      visible: !registrationController.isUploaded.value,
                                      replacement: Text(
                                        "Uploaded",
                                        style: commonTextStyle14Black(),
                                      ),
                                      child: Card(
                                        color: vmsCardBgColor,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color:
                                              vmsGreyColor), // Add a black border
                                          borderRadius: BorderRadius.circular(
                                              20.0), // Adjust border radius as needed
                                        ),
                                        child: SizedBox(
                                          height: getProportionateScreenHeight(35),
                                          width: getProportionateScreenWidth(75),
                                          child: Center(
                                            child: Text(
                                              'Upload',
                                              style: commonStyleModify(
                                                  textColor: vmsWhiteColor,
                                                  fontweight: FontWeight.w400,
                                                  fontsize: 13),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            customSizedBox5(),
                            GestureDetector(
                              onTap: () async {
                                await registrationController.pickImage();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      screenTitle == "Pet" ? "Veterinary Doctor Attestation" : "Signature",
                                      style: commonTextStyle16(),
                                    ),
                                    Visibility(
                                      visible: !registrationController.isUploaded.value,
                                      replacement: Text(
                                        "Uploaded",
                                        style: commonTextStyle14Black(),
                                      ),
                                      child: Card(
                                        color: vmsCardBgColor,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color:
                                              vmsGreyColor), // Add a black border
                                          borderRadius: BorderRadius.circular(
                                              20.0), // Adjust border radius as needed
                                        ),
                                        child: SizedBox(
                                          height: getProportionateScreenHeight(35),
                                          width: getProportionateScreenWidth(75),
                                          child: Center(
                                            child: Text(
                                              'Upload',
                                              style: commonStyleModify(
                                                  textColor: vmsWhiteColor,
                                                  fontweight: FontWeight.w400,
                                                  fontsize: 13),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            customSizedBox5(),
                            GestureDetector(
                              onTap: () async {
                                await registrationController.pickImage();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      screenTitle == "Pet" ? "Breed Specification" : "Upload RC Book",
                                      style: commonTextStyle16(),
                                    ),
                                    Visibility(
                                      visible: !registrationController.isUploaded.value,
                                      replacement: Text(
                                        "Uploaded",
                                        style: commonTextStyle14Black(),
                                      ),
                                      child: Card(
                                        color: vmsCardBgColor,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color:
                                              vmsGreyColor), // Add a black border
                                          borderRadius: BorderRadius.circular(
                                              20.0), // Adjust border radius as needed
                                        ),
                                        child: SizedBox(
                                          height: getProportionateScreenHeight(35),
                                          width: getProportionateScreenWidth(75),
                                          child: Center(
                                            child: Text(
                                              'Upload',
                                              style: commonStyleModify(
                                                  textColor: vmsWhiteColor,
                                                  fontweight: FontWeight.w400,
                                                  fontsize: 13),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            customSizedBox5(),
                            Visibility(
                              visible: screenTitle == "Pet" ? false : true,
                              child: GestureDetector(
                                onTap: () async {
                                  await registrationController.pickImage();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Upload Photo",
                                        style: commonTextStyle16(),
                                      ),
                                      Visibility(
                                        visible: !registrationController.isUploaded.value,
                                        replacement: Text(
                                          "Uploaded",
                                          style: commonTextStyle14Black(),
                                        ),
                                        child: Card(
                                          color: vmsCardBgColor,
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color:
                                                vmsGreyColor), // Add a black border
                                            borderRadius: BorderRadius.circular(
                                                20.0), // Adjust border radius as needed
                                          ),
                                          child: SizedBox(
                                            height: getProportionateScreenHeight(35),
                                            width: getProportionateScreenWidth(75),
                                            child: Center(
                                              child: Text(
                                                'Upload',
                                                style: commonStyleModify(
                                                    textColor: vmsWhiteColor,
                                                    fontweight: FontWeight.w400,
                                                    fontsize: 13),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        customSizedBox5(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Theme(
                              data: ThemeData(
                                unselectedWidgetColor:
                                colorWhite, // Change the inactive background color
                              ),
                              child: Checkbox(
                                checkColor: vmsOrangeColor,
                                activeColor: vmsWhiteColor,
                                value: selectedBox,
                                onChanged: (bool? newValue) {
                                  // Case 1: Simple toggle of checkbox state
                                  selectedBox = newValue ?? false;
                                  // Case 2: Update UI or state based on checkbox state
                                  setState(() {
                                    selectedBox = newValue ?? false;
                                  });
                                },
                                materialTapTargetSize: MaterialTapTargetSize
                                    .shrinkWrap, // Remove padding
                              ),
                            ),
                            SizedBox(width: getProportionateScreenWidth(5)),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text(
                                  'Do you need a PVC card',
                                  softWrap: true,
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  style: commonStyleModify(
                                      fontweight: FontWeight.w400,
                                      textColor: vmsGreyColor,
                                      fontsize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                        customSizedBox15(),
                        Center(
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(registerStatusRoute);
                                },
                                style: alertWindowWithUserActionBgButtonStyle(),
                                child: const Text("Submit",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: vmsWhiteColor))),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget commonTextFields({
    required String hintText,
    required RxBool errorBool,
    required String errorText,
    required Function(String) onChangedPressed,
    required TextEditingController textEditingController,
  }) {
    return Obx(() => TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorBool.value ? errorText : null,
          ),
          onChanged: onChangedPressed,
        ));
  }
}
