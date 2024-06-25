import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vms_application/utils/common_loader_controller/common_loader.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/storage_preference/secured_storage.dart';

final CommonLoaderController commonLoaderController = Get.put(CommonLoaderController());

httpGetMethodApiCall({String? url, Map<String, String>? headers}) async {
  var response = await http.get(Uri.parse(url!), headers: headers);
  try {
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return responseData;
    } else {
      return response.statusCode;
    }
  } on SocketException {
    commonLoaderController.hideLoader();
    Get.toNamed(errorRoute);
    return false;
  } on HttpException {
    commonLoaderController.hideLoader();
    Get.toNamed(errorRoute);
    return false;
  } on FormatException {
    commonLoaderController.hideLoader();
    Get.toNamed(errorRoute);
    return false;
  }
  catch (e) {
    commonLoaderController.hideLoader();
    Get.toNamed(errorRoute);
    throw Exception(e);
  }
}

httpPostMethodApiCall({String? url, Map? data,Map<String, String>? headers,String? typeOfUser,String? screenType}) async {
  Map<String, String>? header = {
    'Authorization' : ""
  };
  try {
      var response = await http.post(Uri.parse(url!),
          headers: header,
          body: data);
      try {
        debugPrint('response of body post : ${response.body}');
        if (response.statusCode == 200) {
          var responseData = jsonDecode(response.body);
          return responseData;
        }
        else if (response.statusCode == 400) {
          var responseData = jsonDecode(response.body);
          return responseData;
        }
        else if (response.statusCode == 401) {
          var responseData = jsonDecode(response.body);
          return responseData;
        }
        else if (response.statusCode == 500) {
          var responseData = jsonDecode(response.body);
          return responseData;
        }
        else {
          return response.statusCode;
        }
      } on SocketException {
        debugPrint("Socket Exception");
        commonLoaderController.hideLoader();
        Get.toNamed(errorRoute);
        return false;
      } on HttpException {
        debugPrint("HTTP Exception");
        commonLoaderController.hideLoader();
        Get.toNamed(errorRoute);
        return false;
      } on FormatException {
        debugPrint("Format Exception");
        commonLoaderController.hideLoader();
        Get.toNamed(errorRoute);
        return false;
      } catch (e) {
        debugPrint("Catch Exception : $e");
        throw Exception(e);
      }
  } on SocketException {
    debugPrint('socket error is found and moved from here');
    commonLoaderController.hideLoader();
    Get.toNamed(errorRoute);
    return false;
  } on HttpException {
    debugPrint('http error is found and moved from here');
    commonLoaderController.hideLoader();
    Get.toNamed(errorRoute);
    return false;
  } on FormatException {
    debugPrint('format error is found and moved from here');
    commonLoaderController.hideLoader();
    Get.toNamed(errorRoute);
    return false;
  }
  catch (e) {
    debugPrint('try cache error is found and moved from here');
    commonLoaderController.hideLoader();
  }
}

httpPutMethodApiCall({String? apiUrl,Map? details}) async {
  final url = Uri.parse(apiUrl!);
  String? headerToken = await SecureStorage.getLoginToken();
  Map<String, String> header = {
    'Authorization' : headerToken.toString()
  };

  try {
    final response = await http.put(
      url,
      headers: header,
      body: details,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.statusCode;
    }
  } on SocketException {
    commonLoaderController.hideLoader();
    return false;
  } on HttpException {
    commonLoaderController.hideLoader();
    return false;
  } on FormatException {
    commonLoaderController.hideLoader();
    return false;
  } catch (error) {
    debugPrint('Error: $error');
  }
}

