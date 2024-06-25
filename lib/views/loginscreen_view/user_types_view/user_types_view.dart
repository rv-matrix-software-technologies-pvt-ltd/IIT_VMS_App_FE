import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_application/controllers/loginscreen_controller/user_types_controller/user_types_controller.dart';
import 'package:vms_application/utils/common_widgets/common_appbar.dart';
import 'package:vms_application/utils/common_widgets/common_reusable_widgets.dart';
import 'package:vms_application/utils/constant/sizeconfig.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/constant/styles.dart';

class VisitorTypeView extends StatelessWidget {
  final VisitorTypeController controller = Get.put(VisitorTypeController());

  VisitorTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iitBgThemeColor,
      appBar: commonAppbar(titleText: "Visitor Type"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSizedBox(16),
            Text(
              'Please select the type of visitor that you wish to register.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            customSizedBox(20),
            Obx(
              () => Column(
                children: [
                  _buildRadioOption(
                      title: 'School Parent',
                      subtitle:
                          'Parent of the student studying in the school within the campus',
                      icon: Icons.school,
                      value: 'School Parent',
                      index: 1),
                  _buildRadioOption(
                      title: 'School Faculty/Staff',
                      subtitle:
                          'Faculty/Staff working in the school within the campus',
                      icon: Icons.work,
                      value: 'School Faculty/Staff',
                      index: 2),
                  _buildRadioOption(
                      title: 'Project Staff',
                      subtitle: 'Project staff working for the institution',
                      icon: Icons.engineering,
                      value: 'Project Staff',
                      index: 3),
                  _buildRadioOption(
                      title: 'Pet',
                      subtitle: 'Pet Owner',
                      icon: Icons.people,
                      value: 'Pet',
                      index: 4),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: ElevatedButton(
                  onPressed: () => Get.toNamed(registerRoute, arguments: {
                    "typeName": controller.selectedVisitorType.value,
                    "typeIndex": controller.selectedVisitorIndex.value
                  }),
                  style: alertWindowWithUserActionBgButtonStyle(),
                  child: const Text(
                    nextText,
                    style: TextStyle(color: vmsWhiteColor),
                  ),
                ),
              ),
            ),
            customSizedBox(16),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required String value,
    required int index,
  }) {
    bool isSelected = controller.selectedVisitorType.value == value;
    return Container(
      height: getProportionateScreenHeight(115),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE0F7FA) : Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: isSelected ? Colors.teal : Colors.grey[300]!,
          width: 1.5,
        ),
      ),
      child: Center(
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            style: commonTextStyle14Black(),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(icon, color: Colors.teal),
          ),
          trailing: Radio<String>(
            value: value,
            groupValue: controller.selectedVisitorType.value,
            onChanged: (value) {
              controller.setSelectedVisitorType(value!);
              controller.selectedVisitorIndex.value = index;
            },
            activeColor: Colors.teal,
          ),
        ),
      ),
    );
  }
}
