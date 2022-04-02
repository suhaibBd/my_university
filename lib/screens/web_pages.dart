import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageScreen extends StatefulWidget
{
  final String universitySite;
    WebPageScreen({required this.universitySite});

  @override
  State<WebPageScreen> createState() => _WebPageScreenState();
}

class _WebPageScreenState extends State<WebPageScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: widget.universitySite,
      ),
    );
  }
}