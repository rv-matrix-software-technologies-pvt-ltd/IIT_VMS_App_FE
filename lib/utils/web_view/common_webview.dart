import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:vms_application/utils/common_widgets/common_loader.dart';

class CommonWebView extends StatefulWidget {
  const CommonWebView({super.key});

  @override
  State<CommonWebView> createState() => _CommonWebViewState();
}

class _CommonWebViewState extends State<CommonWebView> {
  bool _isLoading = true;
  dynamic arguments;

  @override
  void initState() {
    arguments = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri.uri(Uri.parse(arguments))),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  javaScriptEnabled: true,
                ),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
              },
              onLoadStart: (InAppWebViewController controller, Uri? url) {
                setState(() {
                  _isLoading = true;
                });
              },
              onLoadStop: (InAppWebViewController controller, Uri? url) {
                setState(() {
                  _isLoading = false;
                });
              },
            ),
            _isLoading ? customCircularLoader() : Container(),
          ],
        ),
      ),
    );
  }
}
