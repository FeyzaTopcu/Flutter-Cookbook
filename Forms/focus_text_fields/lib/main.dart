import 'package:flutter/material.dart';

//Boş yazma alanları oluşturur.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Field Focus',
      home: MyCustomForm(),
    );
  }
}

//Özel form widgetı tanımlanır.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

//İlgili state sınıfı tanımşlanır. Bu state sınıfı form ile ilili verileri tutar.

class _MyCustomFormState extends State<MyCustomForm> {

  //FocusNode tanımla ve initState yönetimini ve dispose yönetimini temizleyin.
  //FocusNode klavye odağını elde etmek için kullanılan nesne.

  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
   // Form atıldığında odak düğümünü temizle.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Field Focus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

// Uygulama başlar başlamaz ilk metin alanı üzerinde duruldu.
            TextField(
              autofocus: true,
            ),

// Bir kullanıcı dokunduğunda ikinci metin alanı odaklanır
            // FloatingActionButton.
            TextField(
              focusNode: myFocusNode,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

// Düğmeye basıldığında, myFocusNode kullanarak metin alanına odaklanın
        onPressed: () => FocusScope.of(context).requestFocus(myFocusNode),
        tooltip: 'Focus Second Text Field',
        child: Icon(Icons.edit),
      ),
    );
  }
}