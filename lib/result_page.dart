// result_page.dart
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double result;

  ResultPage({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resultado')),
      body: Center(
        child: Text(
          'Resultado: $result',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
