import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:app/offline.dart';
import 'package:url_launcher/url_launcher.dart';

class MyWebView extends StatelessWidget {
  final String title;
  final String selectedUrl;

  final Completer<WebViewController> _controller = Completer<WebViewController>();

  MyWebView({
    required this.title,
    required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: null,
        body: WebView(
          initialUrl: selectedUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onWebResourceError: (WebResourceError webviewerrr) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Offline()),
            );
          },
          navigationDelegate: (NavigationRequest request) async {
            if (request.url.startsWith('https://chain.so/')) {
              try {
                await launch(request.url);
                return NavigationDecision.prevent;
              } catch (e) {
                await launch("https://chain.so/");
                return NavigationDecision.prevent;
              }
            }
            if (request.url.startsWith('https://block.io/')) {
              try {
                await launch(request.url);
                return NavigationDecision.prevent;
              } catch (e) {
                await launch("https://block.io/");
                return NavigationDecision.prevent;
              }
            }
            if (request.url.startsWith('mailto:')) {
              try {
                await launch(request.url);
                return NavigationDecision.prevent;
              } catch (e) {
                await launch("https://www.thunderbird.net/");
                return NavigationDecision.prevent;
              }
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
        ));
  }
}