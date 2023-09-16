import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewPage extends StatefulWidget {
  final String localUrl;
  WebViewPage({required this.localUrl, super.key});

  @override
  State<WebViewPage> createState() => _WebViewAppState(localUrl: localUrl);
}

class _WebViewAppState extends State<WebViewPage> {
  final String localUrl;
  late final WebViewController controller;

  _WebViewAppState({required this.localUrl});

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(
          Uri.parse(localUrl),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          if (await controller.currentUrl() == localUrl) {
            return false;
          }
          if (await controller.canGoBack()){
            controller.goBack();
            return false;
          }else {
            return true;
          }
        },
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}