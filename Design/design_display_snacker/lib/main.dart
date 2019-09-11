import 'package:flutter/material.dart';

void main() => runApp(SnackBarDemo());

// SnackBar Ekranın alt kısmında çıkan uyarı bilgilendirme  mesaj kutusu.
class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(' snackbar'),
        ),
        body: SnackBarr(),
      ),
    );
  }
}

class SnackBarr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: RaisedButton(
        onPressed: () {
          /*
          SnackBar'ı görmek isteyebilirsin.
             Örneğin, kullanıcı bir mesajı yanlışlıkla silerse, mesajı kurtarabilir.
             */
          final snackBar = SnackBar(
            content: Text('Yay! A snackbar'),
            action: SnackBarAction(
              label: 'UNDO',
              onPressed: () {
                //Snackar ile ilgili eklemek istenilenler burada değişir.
              },
            ),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnackBar'),
      ),
    );
  }
}
