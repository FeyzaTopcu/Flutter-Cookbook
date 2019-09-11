import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}
//Özeel bir form widgeti tanımlar.
class MyCustomForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyCustomFormState();
  }
  
  
}
//Form ile ilgili verileri tutan State sınıfı oluşturuyoruz.
class MyCustomFormState extends State<MyCustomForm> {
//Form widgetini tanımlamak için genel bir anahtar tanımlıyoruz.
//Böylece formun doğrulanmasına izin veriyoruz.
// FormState den tanımlanmır. MyCustomFormState den değil.

final _formKey = GlobalKey <FormState>();

  @override
  Widget build(BuildContext context) {

    // Yukarıda yaratılan_formKey kullanılarak bir form widgeti oluşturulur.

    return Form(

      key: _formKey,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value){

              if(value.isEmpty)
                {
                  return 'enter some text';

                }
              return null;
            }
          ),

          ///Ekrandaki boşluklar ayarlanır.
          Padding (
            padding: const EdgeInsets.symmetric( vertical: 16.0),
          child: RaisedButton(
              onPressed: (){
               //validate geçerliyse true değilse false döndrür.

                if( _formKey.currentState.validate()) {

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(
                    content: Text('processing data')
                    

                  
                  )
                  );
                }

              },
child: Text('submit'),

              ),

          ),
        ],

      ),
    );
  }
}