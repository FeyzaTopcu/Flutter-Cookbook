import 'package:flutter/material.dart';
//Bu uygulama yazılan texti uyarı kutusunda bize gösterir.


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}


class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}
//Bir metin denetleyicisi oluşturun ve mevcut değeri almak için kullanın
// TextField’in
class _MyCustomFormState extends State<MyCustomForm> {

  final myController = TextEditingController();

  @override
  void dispose() {
    //Controller atıldığında denetleyici temizlememiz gerekirç
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(

        //// Kullanıcı düğmeye bastığında, aşağıdakileri içeren bir uyarı iletişim kutusu göster:
        //  kullanıcının metin alanına girdiği metin.
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
               //Kullanıcıya yazdığı metin alert ile gösterilir.
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}