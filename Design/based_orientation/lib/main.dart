import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    final appTitle= 'orientation Demo';

    return MaterialApp(
      title: appTitle,
      home: OrientationList (
        title: appTitle,
      ),

    );
  }

}

class OrientationList extends StatelessWidget
{
  final String title;
  OrientationList ({Key key, this.title}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title)),
      body: OrientationBuilder(
        //Sütun sayısını değiştirmek için bir OrientationBuilder kullanın.
          builder: (context, orientation)
              {
                return GridView.count(
/*
öğelerinizi sırayla sırayla gelen normal öğeler listesinden ziyade kılavuz olarak görüntülemek için kullanılır.
 */
                    //Listedeki ayarların yapıldığı yer
                    crossAxisCount: orientation == Orientation.portrait ? 2: 3 ,
                  // Ekranda kaç öge kullanılacağını ayarlar
                children: List.generate(100,(index) {

                  return Center (
                    child: Text('Item $index',
                    style: Theme.of(context).textTheme.headline,
                    ),
                  );
                }
                 ),
                 );
                 })


    );
  }



}