import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}
//MyApp ta bir Stateful widget kullanılır. Çünkü bir ögeyi kaldırmamız gerekiyor ve bu tür işlemlerde Stateful Widget kullanılır.

class MyApp extends StatefulWidget {

  MyApp({Key key}) : super (key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }

}

class MyAppState extends State<MyApp> {

  final items = List<String>.generate(3, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final title = 'Dismissing Items';

    return MaterialApp(

        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ), // Each Dismissible must contain a Key. Keys allow Flutter to
        // uniquely identify widgets.
        home: Scaffold(
        appBar: AppBar(
        title: Text(title),

    ),

    body: ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
    final item = items[index];

    return Dismissible(
    //Her Dismissible bir anahtar içermelidir.
    //Widgetları benzersiz şekilde tanımlayın.
    key: Key(item),
    onDismissed: (direction){
    setState(() {
    items.removeAt(index);
    //ögeyi veri kaynağından kaldırır.
    });
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("$item dismissed")));
    },

// Öğe kaydırıldığında kırmızı bir arka plan göster
    background: Container(color: Colors.red),
    child: ListTile(title: Text('$item')),
    );
    },
    ),
    ),
    );
    }
}
//ögeyi veri kaynağından kaldırır.
    //Fonksiyonda sağa kaydırdığında ne olacağını belirtiyor.

    /*
            return Dismissible(
//Her Dismissible bir anahtar içermelidir.
    //Widgetları benzersiz şekilde tanımlayın.
    key: Key(item),
    //Fonksiyonda sağa kaydırdığında ne olacağını belirtiyor.
              onDismissed: (direction){
                setState(() {
                  items.removeAt(index);
//ögeyi veri kaynağından kaldırır.
                });
                Scaffold.of(context)
                .showSnackBar(SnackBar(content:Text("$item dismissed")},
                ))
                //Snacbarı gösteriyoruz
                
              },
              */

