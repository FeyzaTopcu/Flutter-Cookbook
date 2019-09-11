import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Page1(),
  ));
}

class Page1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          child: Text('Go!'),
          onPressed: () {
            //diğer sayfaya gidiş yoluna gönderiyor
            Navigator.of(context).push(_createRoute());
          },
        ),
      ),
    );
  }
}

Route _createRoute() {
  // Animasyon objesi ve denetleyicileri ile oluşturulacak bir widget oluşturur.

  return PageRouteBuilder(
    //diğer sayfaya gidecek yol ile ilgili geçiş özellikleri oluşturuluyor.
    pageBuilder: (context, animation, secondaryAnimation) => Page2(),
    //Interval sınıfı sayesinde projenin başlangıç bitiş noktaları belirtilir.
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      //Curve Interval sınıfından türetilir. Curve objesi CurveAnimation a dönüştürülür.
      //Geçişin yavaş yada hızlı olduğunu belirtir.
      var curve = Curves.ease;
//Tween bir giriş aralığından çıkış aralığına planlamayı yapan stateless bir objedir
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      //CurveTween animasyonun hareket eğrisini belirler.
      // Transition , widget'ı boyamadan önce geçişi sağlar.
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Page 2'),
      ),
    );
  }
}