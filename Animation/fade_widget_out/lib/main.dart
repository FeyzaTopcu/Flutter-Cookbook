import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Opacity Demo';
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

// StatefulWidget veri almak için kullanılır.

//Widget sayesinde  MyHomePage oluşur
class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// State sınıfı iki şeyden sorumludur: yapabileceğiniz bazı verileri tutmak bu verileri kullanarak kullanıcı arayüzünü güncelleme ve oluşturma.
class _MyHomePageState extends State<MyHomePage> {
  // Whether the green box should be visible
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedOpacity(
          //Eğer gizlemek istiyorsak 0.0, görünür yapmak istiyorsak 1.0 yaparız.
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
         //Oluşturduğumuz yeşil kutu, AnimatedOpacity widget'ının bir çocuğu olmalıdır.
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // setState fonks çağırın.setState değişikleri yeniden düzenlemesi gerektiğini hatırlatır.
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: Icon(Icons.flip),
      ), //Arka arkaya koyulan virgül kodların görüntüsündeki karmaşayı azaltır.
    );
  }
}