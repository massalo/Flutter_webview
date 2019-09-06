import 'package:flutter/material.dart';
import 'web_view_container.dart';
import 'howtoplay.dart';

class Home extends StatelessWidget {
  final links2 = 'https://puroangola.com/cafe/';

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
              (urlButton1(context)),
              (_urlButton2(context, url2))
            ],
          ),
        ),
      ),
    );
  }

  //BUTTON 1 COMO JOGAR --> HOWTOPLAY
  Widget urlButton1(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: FlatButton(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        //here the buttons use either the url or a "title", ths problem is ging differente "titles"
        child: Text('Como Jogar'),
        textColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Howtoplay()));
        },
//            _handleURLButtonPress1(context, url1),
      ),
    );
  }

//BUTTON 2 --> O JOGO COMECAR
  Widget _urlButton2(BuildContext context, String url2) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: FlatButton(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        //here the buttons use either the url or a "title", ths problem is ging differente "titles"
        child: Text('Começar'),
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
