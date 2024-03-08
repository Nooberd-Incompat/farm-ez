import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageViewer extends StatelessWidget {
  final String url;
  final String title;

  const WebPageViewer({super.key, required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: (url == '')
          ? Container(
              alignment: Alignment.center,
              height: double.infinity,
              width: double.infinity,
              color: const Color.fromARGB(255, 254, 248, 254),
              child: const Image(
                image: AssetImage('assets/images/coming_soon.png'),
              ),
            )
          : WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
            ),
    );
  }
}
