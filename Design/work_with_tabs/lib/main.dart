import 'package:flutter/material.dart';

void main() => runApp(TabBarDemo());
//Tabbar kayan pencere yapmak için kullanılır.

class TabBarDemo  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: DefaultTabController(

        //gösterilecek içerik sayısı
          length: 3,

          child: Scaffold(

            appBar: AppBar(
              bottom: TabBar(
                  tabs: [
                    Tab(icon:Icon(Icons.directions_car)),
                    Tab(icon: Icon(Icons.directions_transit)),
                    Tab(icon: Icon(Icons.directions_bike)),
                  ]),
              title: Text('Tabs Demo'),

            ),
            body: TabBarView(
              children: <Widget>[
                Icon(Icons.directions_car),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),


              ],

            ),
          )),


    );
  }



}