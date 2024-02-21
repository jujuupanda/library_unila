import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewSSOPage extends StatefulWidget {
  const WebViewSSOPage({super.key});

  @override
  State<WebViewSSOPage> createState() => _WebViewSSOPageState();
}

class _WebViewSSOPageState extends State<WebViewSSOPage> {
  WebViewController? _webViewController;
  String appKey= 'T0aoId2UIUXAbrb0gA1PiohIkYVaPobjCUMgQanxH3w=';

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://akses.unila.ac.id/api/live/v1/auth/login/sso?app_key=${appKey}'));
  }

  @override
  Widget build(BuildContext context) {
    print(_webViewController!.currentUrl());
    return Scaffold(
      appBar: AppBar(title: const Text('Login SSO Unila')),
      body: Expanded(child: WebViewWidget(controller: _webViewController!)),
    );
  }
}
