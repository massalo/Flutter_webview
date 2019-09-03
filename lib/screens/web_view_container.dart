import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final url1;
  //final url2;
  WebViewContainer(this.url1);

  @override
  createState() => _WebViewContainerState(this.url1);
}

//here
class WebViewContainer2 extends StatefulWidget {
  final url1;
  //final url2;
  WebViewContainer2(this.url1);

  @override
  createState() => _WebViewContainerState(this.url1);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  final _key = UniqueKey();

  _WebViewContainerState(this._url);

  var controller = _WebViewContainerState;

//TRYING TO FIGURE OUT HOW TO MAKE IT REFRESH THE WEBVIEW, right now it does nothing
  //https://stackoverflow.com/questions/57215843/how-to-reload-webview-in-flutter
  void _getRefreshWebsite() {
    setState(() {
      //_url = ;
      // this.load;
    });
  }

  // WebViewContainer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
            child: WebView(
                key: _key,
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: _url))
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: _getRefreshWebsite, child: Icon(Icons.refresh)),
    );
  }
}
