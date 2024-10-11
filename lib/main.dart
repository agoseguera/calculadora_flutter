import 'package:flutter/material.dart';
import 'math_operations.dart';
import 'result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _num1Controller = TextEditingController();
  final _num2Controller = TextEditingController();
  final _mathOperations = MathOperations();

  void _navigateToResult(BuildContext context, double result) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(result: result),
      ),
    );
  }

  void _onOperation(String operation) {
    double? num1 = double.tryParse(_num1Controller.text);
    double? num2 = double.tryParse(_num2Controller.text);

    if (num1 == null || num2 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa números válidos')),
      );
      return;
    }

    try {
      double result;
      switch (operation) {
        case 'Suma':
          result = _mathOperations.suma(num1, num2);
          break;
        case 'Resta':
          result = _mathOperations.resta(num1, num2);
          break;
        case 'Multiplicación':
          result = _mathOperations.multiplicacion(num1, num2);
          break;
        case 'División':
          result = _mathOperations.division(num1, num2);
          break;
        default:
          return;
      }

      _navigateToResult(context, result);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _onOperation('Suma'),
              child: Text('Suma'),
            ),
            ElevatedButton(
              onPressed: () => _onOperation('Resta'),
              child: Text('Resta'),
            ),
            ElevatedButton(
              onPressed: () => _onOperation('Multiplicación'),
              child: Text('Multiplicación'),
            ),
            ElevatedButton(
              onPressed: () => _onOperation('División'),
              child: Text('División'),
            ),
          ],
        ),
      ),
    );
  }
}
