import 'package:flutter/material.dart';
import 'package:vms_application/utils/constant/styles.dart';

Widget customCircularLoader() {
  return const Center(
    child: FractionallySizedBox(
      widthFactor: 0.10,
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 4.0,
        valueColor: AlwaysStoppedAnimation<Color>(vmsBlackColor),
      ),
    ),
  );
}
