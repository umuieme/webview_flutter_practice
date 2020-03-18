import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: _buildWebview(),
      ),
    );
  }

  NavigationDecision _interceptNavigation(NavigationRequest request) {
    if (request.url == "https://github.com/flutter/flutter/issues") {
      return NavigationDecision.prevent;
    }
    if (request.url.contains("umuieme")) {
      launch(request.url);
      return NavigationDecision.prevent;
    }
    return NavigationDecision.navigate;
  }

  _buildWebview() {
    return WebView(
      initialUrl: "https://vivaciousasiangianthornet.htmlpasta.com/",
      navigationDelegate: this._interceptNavigation,
    );
  }
}
