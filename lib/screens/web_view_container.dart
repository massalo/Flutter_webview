import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final url1;
  //final url2;
  WebViewContainer(this.url1);

  @override
  createState() => _WebViewContainerState(this.url1);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  final _key = UniqueKey();
  _WebViewContainerState(this._url);

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Expanded(
              child: WebView(
            key: _key,
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: _url,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          ))
        ]),
        floatingActionButton: FutureBuilder<WebViewController>(
            future: _controller.future,
            builder: (BuildContext context,
                AsyncSnapshot<WebViewController> snapshot) {
              final bool webViewReady =
                  snapshot.connectionState == ConnectionState.done;
              final WebViewController controller = snapshot.data;

              if (snapshot.hasData) {
                return FloatingActionButton(
                    child: Icon(Icons.arrow_forward),
                    onPressed: !webViewReady
                        ? null
                        : () async {
                            controller.clearCache();
                            controller.reload();
                          });
              }

              return Container();
            }));
  }
}
