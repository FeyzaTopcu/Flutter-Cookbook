import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(),
  ));
}

class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
 //Kullanıcı FloatingActionButton 'a tıkladığında değişecek özellikler yazılır.
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aniated Demo'),
        ),
        body: Center(
          child: AnimatedContainer(
            // State sınıfında tanınmlanan özelliklerin çağırıldığı yer
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
            duration: Duration(
              //Geçişin ne kadar sürdüğünü belirten yer.
                seconds: 1
            ),
            //Geçişlerin daha yavaş olması için yapılan yar
            curve: Curves.fastOutSlowIn,
          ),

        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.play_arrow),
//Kullanıcı butona bastığında burası çalışır.
            onPressed: () {

// Widget'ı yeni değerlerle yeniden oluşturmak için setState'i kullanıcaz.
              setState(() {
                //Random sayı oluşturucaz.
                final random = Random();
                //Rasgele genişlik ve yükseklik tanımlayacağız.
                _width= random.nextInt(300).toDouble();
                _height= random.nextInt(300).toDouble();

                //Rasgele renkler üreteceğiz.
                _color = Color.fromRGBO(

                  random.nextInt(256),
                  random.nextInt(256),
                  random.nextInt(256),
                1,
                );
                //Rasgele sınır yarıçapı üretiyoruz.
                _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());

              });
            }),


      ),

    );
  }
}
