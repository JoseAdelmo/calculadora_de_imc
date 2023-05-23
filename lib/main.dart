import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = "Informe seus dados!";

  void _resetFields()
  {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
    });
  }

  void _calculate()
  {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

     if(imc < 18.6){
      _infoText = 'Abaixo do peso (${imc.toStringAsPrecision(3)})';
     } else if(imc >= 18.6 && imc < 24.9){
      _infoText = 'Peso ideal (${imc.toStringAsPrecision(3)})';
     } else if(imc >= 24.9 && imc < 29.9){
      _infoText = 'Levemente acima do peso (${imc.toStringAsPrecision(3)})';
     } else if(imc >= 29.9 && imc < 34.9){
      _infoText = 'Obesidade Grau I (${imc.toStringAsPrecision(3)})';
     } else if(imc >= 34.9 && imc < 39.9){
      _infoText = 'Obesidade Grau II (${imc.toStringAsPrecision(3)})';
     } else if(imc >= 40){
      _infoText = 'Obesidade Grau III (${imc.toStringAsPrecision(3)})';
     }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: _resetFields, icon: Icon(Icons.refresh)),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 120.0, color: Colors.blue),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite seu peso em (Kg)',
                labelStyle: TextStyle(color: Colors.blue),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 18.0),
              controller: weightController,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite sua altura em (cm)',
                labelStyle: TextStyle(color: Colors.blue),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 18.0),
              controller: heightController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 40.0,
                child: ElevatedButton(
                  onPressed: _calculate,
                  child: Text(
                    'Calcular',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                ),
              ),
            ),
            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 18.0),
            )
          ],
        ),
      ),
    );
  }
}