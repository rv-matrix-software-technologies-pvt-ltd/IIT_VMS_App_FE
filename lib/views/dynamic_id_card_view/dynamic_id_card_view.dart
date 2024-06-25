import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_application/utils/common_widgets/common_reusable_widgets.dart';
import 'package:vms_application/utils/constant/sizeconfig.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';

class DynamicIDCardView extends StatefulWidget {
  const DynamicIDCardView({super.key});

  @override
  State<DynamicIDCardView> createState() => _DynamicIDCardViewState();
}

class _DynamicIDCardViewState extends State<DynamicIDCardView> with WidgetsBindingObserver {
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
      body: SafeArea(
        child: _buildColumn(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
          BottomNavigationBarItem(icon: Icon(Icons.badge), label: 'Passes'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        currentIndex: 2, // Set the default selected index
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
              break;
            default:
              Get.toNamed(visitorUserRoute);
          }
          // Handle navigation
        },
      ),
    );
  }

  Widget _buildColumn() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      _buildTopContainer(),
      _buildMidContainerWithButton(),
    ],
  );

  Widget _buildTopContainer() => Flexible(
    flex: 12,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(0.0),
            bottomRight: Radius.circular(20.0),
            topLeft: Radius.circular(0.0),
            bottomLeft: Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customSizedBox25(),
          const Text(
            'School - Parent Access Card',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          customSizedBox25(),
          Image.asset(userIconImg,
          height: getProportionateScreenHeight(125),
          width: getProportionateScreenWidth(125),
          ),
          customSizedBox25(),
          const Text(
            'PS0002435670',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          customSizedBox15(),
          const Text(
            'User Name',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );

  Widget _buildMidContainerWithButton() {
    const buttonHeight = 220.0;
    return Stack(
      children: [
        // Use same background color like the second container
        Container(height: buttonHeight, color: Colors.white),
        // Translate the button
        Transform.translate(
          offset: const Offset(0.0, - buttonHeight / 3.0),
          child: Center(
            child: GestureDetector(
              onTap: () { /* do stuff */ },
              child: Container(
                height: buttonHeight,
                decoration: BoxDecoration(
                  // color: Colors.orange[400],
                  // borderRadius: BorderRadius.circular(buttonHeight / 2.0),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      offset: const Offset(0.0, 2.0),
                      color: Colors.black.withOpacity(0.16),
                    ),
                  ],
                ),
                // padding: const EdgeInsets.fromLTRB(24.0, 3.0, 24.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://via.placeholder.com/150',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomContainer() => Flexible(
    flex: 1,
    child: Container(
      color: Colors.white,
      child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bottom container',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ]),
    ),
  );
}
