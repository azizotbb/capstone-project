import 'package:flutter/material.dart';
import 'package:makfoul_app/screen/payment/orderwating.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewpage extends StatelessWidget {
  const WebViewpage({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    final ctrl = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            if (url.contains("paid")) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const Orderwaiting()),
              );
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(title: Text('payment page')),
      body: WebViewWidget(controller: ctrl),
    );
  }
}


