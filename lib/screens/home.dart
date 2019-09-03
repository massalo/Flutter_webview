import 'package:flutter/material.dart';
import 'web_view_container.dart';

class Home extends StatelessWidget {
  final links1 = 'http://puroangola.com/ojogo/getData.php';
  final links2 = 'http://puroangola.com/';

  String get url1 => links1.toString();
  String get url2 => links2.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('O JOGO DAS RELAÇÕES'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              (_urlButton1(context, url1)),
              (_urlButton2(context, url2))
            ],
          ),
        ),
      ),
    );
  }

  //buttons
  Widget _urlButton1(BuildContext context, String url1) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: FlatButton(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        //here the buttons use either the url or a "title", ths problem is ging differente "titles"
        child: Text('Casais'),
        textColor: Colors.white,
        onPressed: () => _handleURLButtonPress1(context, url1),
      ),
    );
  }

  //calls the url1
  void _handleURLButtonPress1(BuildContext context, String url1) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url1)));
  }

  Widget _urlButton2(BuildContext context, String url2) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: FlatButton(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        //here the buttons use either the url or a "title", ths problem is ging differente "titles"
        child: Text('Amigos'),
        textColor: Colors.white,
        onPressed: () => _handleURLButtonPress2(context, url2),
      ),
    );
  }

  //calls the url2
  void _handleURLButtonPress2(BuildContext context, String url2) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(links2)));
  }
}
