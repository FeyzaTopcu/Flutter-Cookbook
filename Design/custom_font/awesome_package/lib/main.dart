
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      title: 'Custom Fonts',

// Raleway'i varsayılan uygulama yazı tipi olarak ayarla.

      theme: ThemeData(fontFamily: 'Raleway'),

    home: MyHomePage(),

    );
  }

}

class MyHomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

// AppBar uygulaması varsayılan Raleway yazı tipini kullanır

    appBar: AppBar(
      title: Text(' Custom Fonts'),
    ),
      body: Center(
        child: Text('Roboto Mono Sample',
        style: TextStyle( fontFamily: 'RobotoMono'),),
        // Text RobotoMono yazı tipini kullanır.
      ),
    );
  }

}